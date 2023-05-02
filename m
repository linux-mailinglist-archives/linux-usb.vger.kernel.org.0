Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A49A16F4C60
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 23:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjEBVtX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 17:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjEBVtW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 17:49:22 -0400
X-Greylist: delayed 367 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 02 May 2023 14:49:20 PDT
Received: from mail.dieselschrauber.org (mail.dieselschrauber.org [178.209.53.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CA010FE
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 14:49:20 -0700 (PDT)
Received: from [192.168.1.111] (unknown [194.191.235.18])
        by mail.dieselschrauber.org (Postfix) with ESMTPSA id A708B3760585
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 23:43:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=kaufmann-automotive.ch; s=dkim; t=1683063790;
        bh=nY75ThebTvt652Dd0kWeuH/axKVt3YJfQXf6RLuaF4k=;
        h=Date:To:Reply-To:From:Subject:From;
        b=tyN9GS0/jebM3QIbESfp9MjE0TTxubjEGsuSe44/jn1J7TL0YAOYdrtx4O38dRMrp
         FcGpgjlUrFho8dnMcA8r9fuWh6d88mXwsFu833zQNGnGg8smjCw1mAjLXDOjM7qz1I
         OexKEh9VtImfxRYU8eRvdZVOi3IhsBLG2ruf3Wkw=
Content-Type: multipart/mixed; boundary="------------2jbYGWIvyEQwzmoK0nbqh5dR"
Message-ID: <40a1a3f4-46bf-1f3d-34a4-ff5c6f67dbaa@kaufmann-automotive.ch>
Date:   Tue, 2 May 2023 23:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: de-AT-frami
To:     linux-usb@vger.kernel.org
Reply-To: info@kaufmann-automotive.ch
From:   Kaufmann Automotive GmbH <info@kaufmann-automotive.ch>
Subject: USB driver assignment request
Organization: Kaufmann Automotive GmbH
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------2jbYGWIvyEQwzmoK0nbqh5dR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear sirs and madams,

dmesg tells me on

Linux Inspiron-580 4.15.0-210-generic #221-Ubuntu SMP Tue Apr 18 
08:32:52 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux

:


[  973.029692] usbcore: registered new interface driver usbserial_generic
[  973.029715] usbserial: USB Serial support registered for generic
[  978.333148] usb 2-1.4: new full-speed USB device number 9 using ehci-pci
[  978.443928] usb 2-1.4: New USB device found, idVendor=16d0, 
idProduct=0870
[  978.443932] usb 2-1.4: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[  978.443934] usb 2-1.4: Product: RKS+CAN VCP
[  978.443936] usb 2-1.4: Manufacturer: KAUFMANN
[  978.443938] usb 2-1.4: SerialNumber: RKS+CAN
[  978.444482] cdc_acm: probe of 2-1.4:1.0 failed with error -22
[  978.444492] usbserial_generic 2-1.4:1.0: The "generic" usb-serial 
driver is only for testing and one-off prototypes.
[  978.444494] usbserial_generic 2-1.4:1.0: Tell 
linux-usb@vger.kernel.org to add your device to a proper driver.
[  978.444496] usbserial_generic 2-1.4:1.0: generic converter detected
[  978.444608] usb 2-1.4: generic converter now attached to ttyUSB0
[  978.445018] usbserial_generic 2-1.4:1.1: The "generic" usb-serial 
driver is only for testing and one-off prototypes.
[  978.445021] usbserial_generic 2-1.4:1.1: Tell 
linux-usb@vger.kernel.org to add your device to a proper driver.
[  978.445023] usbserial_generic 2-1.4:1.1: generic converter detected
[  978.445227] usb 2-1.4: generic converter now attached to ttyUSB1

please assign idVendor=16d0, idProduct=0870 to be used as virtual serial 
port.

Thank you and best regards, Rainer

-- 
Kaufmann Automotive GmbH
Dipl.Ing.(FH) Rainer Kaufmann
Süsswinkelstrasse 9
CH-9453 Eichberg

<https://www.kaufmann-automotive.ch>

shop.dieselschrauber.org <https://shop.dieselschrauber.org> - 
www.canhack.de <https://www.canhack.de> - www.kaufmann-automotive.ch 
<https://www.kaufmann-automotive.ch>

********************************************************************************
Diese E-Mail, einschließlich sämtlicher mit ihr übertragener Dateien,
ist vertraulich. Eine Weitergabe an andere als die adressierten Personen
oder Unternehmen darf nur im Einverständnis der Adressaten erfolgen.
********************************************************************************
--------------2jbYGWIvyEQwzmoK0nbqh5dR
Content-Type: text/vcard; charset=UTF-8; name="info.vcf"
Content-Disposition: attachment; filename="info.vcf"
Content-Transfer-Encoding: base64

YmVnaW46dmNhcmQNCmZuOlJhaW5lciBLYXVmbWFubg0KbjpLYXVmbWFubjtSYWluZXINCm9y
ZzpLYXVmbWFubiBBdXRvbW90aXZlIEdtYkgNCmFkcjtxdW90ZWQtcHJpbnRhYmxlOjs7Uz1D
Mz1CQ3Nzd2lua2Vsc3RyYXNzZSA5O0VpY2hiZXJnO1NHOzk0NTM7U2Nod2Vpeg0KZW1haWw7
aW50ZXJuZXQ6aW5mb0BrYXVmbWFubi1hdXRvbW90aXZlLmNoDQp0aXRsZTpEaXBsLi1Jbmcu
IChGSCkgRWxla3Ryb3RlY2huaWsNCnVybDpodHRwczovL3d3dy5rYXVmbWFubi1hdXRvbW90
aXZlLmNoDQp2ZXJzaW9uOjIuMQ0KZW5kOnZjYXJkDQoNCg==

--------------2jbYGWIvyEQwzmoK0nbqh5dR--
