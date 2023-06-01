Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F074071F0C1
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jun 2023 19:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbjFAR3G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jun 2023 13:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232009AbjFAR3E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jun 2023 13:29:04 -0400
Received: from mail.dieselschrauber.org (mail.dieselschrauber.org [178.209.53.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB21D136
        for <linux-usb@vger.kernel.org>; Thu,  1 Jun 2023 10:29:00 -0700 (PDT)
Received: from [192.168.1.44] (unknown [194.191.235.18])
        by mail.dieselschrauber.org (Postfix) with ESMTPSA id 46EC63760235;
        Thu,  1 Jun 2023 19:28:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=kaufmann-automotive.ch; s=dkim; t=1685640538;
        bh=EO0DAeQqJQoWpSLIWuxCo7ch/qJbLjwXpZaElFSCf8A=;
        h=Date:Reply-To:Subject:To:References:From:In-Reply-To:From;
        b=iqPWq7Hs7Boy1Gh7fG0EqzQONuvO2zTEsea/90ZIJkVhmNXwy7FPGcLFT+iQKBg6R
         d8ApB2iEuDDpdlwH6f4qkGCIk4vqts1vKzf1CeLVycreO8qdJaSDEMCBMRyA3SX6v6
         mHchgfdwTzj9dFCZY06Erb2Oiss3O+L8PeNz1Qk4=
Content-Type: multipart/mixed; boundary="------------5MpBqvU00SuwKoh2Y64qK9yM"
Message-ID: <c2193d66-bf49-6a0e-1b7a-cf357265ffa6@kaufmann-automotive.ch>
Date:   Thu, 1 Jun 2023 19:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Reply-To: info@kaufmann-automotive.ch
Subject: Re: USB driver assignment request
Content-Language: en-US
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <40a1a3f4-46bf-1f3d-34a4-ff5c6f67dbaa@kaufmann-automotive.ch>
 <02366b3d-0dcf-2e13-579f-3da3726175f6@suse.com>
From:   Rainer Kaufmann <info@kaufmann-automotive.ch>
Organization: Kaufmann Automotive GmbH
In-Reply-To: <02366b3d-0dcf-2e13-579f-3da3726175f6@suse.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------5MpBqvU00SuwKoh2Y64qK9yM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Oliver,

thank you very much providing the patch (attached).

I finally had time to test it and everything works fine!

[ 8061.025594] usbserial: USB Serial support registered for kaufmann
[ 8061.025611] usb_serial_simple 2-1.3:1.0: kaufmann converter detected
[ 8061.031722] usb 2-1.3: kaufmann converter now attached to ttyUSB0

I would be happy if my vendor/device ids could be added for future in 
usb-serial-simple.

Best regards, Rainer


Kaufmann Automotive GmbH
Dipl.Ing.(FH) Rainer Kaufmann
Süsswinkelstrasse 9
CH-9453 Eichberg

Web: https://www.kaufmann-automotive.ch

********************************************************************************
Diese E-Mail, einschließlich sämtlicher mit ihr übertragener Dateien,
ist vertraulich. Eine Weitergabe an andere als die adressierten Personen
oder Unternehmen darf nur im Einverständnis der Adressaten erfolgen.
********************************************************************************

Am 03.05.23 um 13:37 schrieb Oliver Neukum:
> 
> 
> On 02.05.23 23:43, Kaufmann Automotive GmbH wrote:
>> Dear sirs and madams,
> 
>>
>> please assign idVendor=16d0, idProduct=0870 to be used as virtual 
>> serial port.
> 
> Hi,
> 
> please test the attached patch.
> 
>      Regards
>          Oliver
--------------5MpBqvU00SuwKoh2Y64qK9yM
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-USB-serial-simple-adding-Kaufmann-RKS-CAN-VCP.patch"
Content-Disposition: attachment;
 filename="0001-USB-serial-simple-adding-Kaufmann-RKS-CAN-VCP.patch"
Content-Transfer-Encoding: base64

RnJvbSAxYmI4Njk1OWI2Njk3NjhlMmRjNjkxZWU4NGFiMWU0NDJmNTZmODI5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBXZWQsIDMgTWF5IDIwMjMgMTM6MzQ6NDcgKzAyMDAKU3ViamVjdDogW1BBVENI
XSBVU0I6IHNlcmlhbC1zaW1wbGU6IGFkZGluZyBLYXVmbWFubiBSS1MrQ0FOIFZDUAoKQWRk
aW5nIHRoZSBkZXZpY2UgYW5kIHByb2R1Y3QgSUQKClJlcG9ydGVkLWJ5OiBLYXVmbWFubiBB
dXRvbW90aXZlIEdtYkggPGluZm9Aa2F1Zm1hbm4tYXV0b21vdGl2ZS5jaD4KU2lnbmVkLW9m
Zi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1bUBzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3Vz
Yi9zZXJpYWwvdXNiLXNlcmlhbC1zaW1wbGUuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3NlcmlhbC91
c2Itc2VyaWFsLXNpbXBsZS5jIGIvZHJpdmVycy91c2Ivc2VyaWFsL3VzYi1zZXJpYWwtc2lt
cGxlLmMKaW5kZXggNGM2NzQ3ODg5YTE5Li4zNjEyMDMxMDMwYmIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdXNiL3NlcmlhbC91c2Itc2VyaWFsLXNpbXBsZS5jCisrKyBiL2RyaXZlcnMvdXNi
L3NlcmlhbC91c2Itc2VyaWFsLXNpbXBsZS5jCkBAIC0xMTcsNiArMTE3LDExIEBAIERFVklD
RShzdXVudG8sIFNVVU5UT19JRFMpOwogCXsgVVNCX0RFVklDRSgweDkwOCwgMHgwMDA0KSB9
CiBERVZJQ0Uoc2llbWVuc19tcGksIFNJRU1FTlNfSURTKTsKIAorLyogS0FVRk1BTk4gUktT
K0NBTiBWQ1AgKi8KKyNkZWZpbmUgS0FVRk1BTk5fSURTKCkJCQlcCisJeyBVU0JfREVWSUNF
KDB4MTZkMCwgMHgwODcwKSB9CitERVZJQ0Uoa2F1Zm1hbm4sIEtBVUZNQU5OX0lEUyk7CisK
IC8qIEFsbCBvZiB0aGUgYWJvdmUgc3RydWN0dXJlcyBtdXNoZWQgaW50byB0d28gbGlzdHMg
Ki8KIHN0YXRpYyBzdHJ1Y3QgdXNiX3NlcmlhbF9kcml2ZXIgKiBjb25zdCBzZXJpYWxfZHJp
dmVyc1tdID0gewogCSZjYXJlbGlua19kZXZpY2UsCkBAIC0xMzMsNiArMTM4LDcgQEAgc3Rh
dGljIHN0cnVjdCB1c2Jfc2VyaWFsX2RyaXZlciAqIGNvbnN0IHNlcmlhbF9kcml2ZXJzW10g
PSB7CiAJJmhwNHhfZGV2aWNlLAogCSZzdXVudG9fZGV2aWNlLAogCSZzaWVtZW5zX21waV9k
ZXZpY2UsCisJJmthdWZtYW5uX2RldmljZSwKIAlOVUxMCiB9OwogCkBAIC0xNTEsNiArMTU3
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lkIGlkX3RhYmxlW10gPSB7
CiAJSFA0WF9JRFMoKSwKIAlTVVVOVE9fSURTKCksCiAJU0lFTUVOU19JRFMoKSwKKwlLQVVG
TUFOTl9JRFMoKSwKIAl7IH0sCiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRSh1c2IsIGlkX3Rh
YmxlKTsKLS0gCjIuNDAuMQoK

--------------5MpBqvU00SuwKoh2Y64qK9yM--
