/**
 * OpenALの宣言をpublic importします。
 * OpenALのAPIを直接扱いたいときに使用します。
 */
module thino.openal;

version (NoSound) {} else {

public import openal.al;
public import openal.alc;

}

