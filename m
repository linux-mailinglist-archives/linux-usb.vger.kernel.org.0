Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 818EE4E5D50
	for <lists+linux-usb@lfdr.de>; Thu, 24 Mar 2022 03:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345909AbiCXCqT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Mar 2022 22:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347871AbiCXCqR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Mar 2022 22:46:17 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0D895480
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 19:44:43 -0700 (PDT)
Received: from [192.168.2.3] (ip-78-45-150-87.net.upcbroadband.cz [78.45.150.87])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: janecek)
        by jabberwock.ucw.cz (Postfix) with ESMTPSA id 1F0A01C0B87;
        Thu, 24 Mar 2022 03:44:42 +0100 (CET)
Content-Type: multipart/mixed; boundary="------------GLkwoXh1nemDJrp00ST70qQH"
Message-ID: <63b772ff-ef03-5f0a-c42c-ad9ec9770f16@ucw.cz>
Date:   Thu, 24 Mar 2022 03:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From:   Petr Janecek <janecek@ucw.cz>
Subject: Re: Apogee ONEv2 keeps resetting
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
References: <3f4d1bce-7459-9ea4-be73-9b51f569e526@ucw.cz>
 <YjoPVAxeKtY6aV1s@rowland.harvard.edu>
Content-Language: en-US
In-Reply-To: <YjoPVAxeKtY6aV1s@rowland.harvard.edu>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------GLkwoXh1nemDJrp00ST70qQH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alan,

On 3/22/22 19:03, Alan Stern wrote:
> On Sun, Mar 20, 2022 at 02:15:40AM +0100, Petr Janecek wrote:
>> Hi,
>>     I'm trying to use Apogee ONEv2.  From usb dumps under
>> macos or windows it seems like a usb Class Audio 2.0
>> device, but in linux, it keeps resetting every two seconds
>> or so.  It keeps resetting even when the snd-usb-audio
>> driver is disabled, so the problem is probably at a lower
>> level.
> 
> Can you post the log output on a system where snd-usb-audio is disabled?

[ 3412.279063] usb 3-8: new high-speed USB device number 6 using xhci_hcd
[ 3412.470003] usb 3-8: New USB device found, idVendor=0c60, 
idProduct=0017, bcdDevice= 1.05
[ 3412.470017] usb 3-8: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[ 3412.470023] usb 3-8: Product: ONEv2
[ 3412.470028] usb 3-8: Manufacturer: Apogee
[ 3412.470033] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
[ 3413.217053] usb 3-8: USB disconnect, device number 6
[ 3413.629046] usb 3-8: new high-speed USB device number 7 using xhci_hcd
[ 3413.829760] usb 3-8: New USB device found, idVendor=0c60, 
idProduct=0017, bcdDevice= 1.05
[ 3413.829766] usb 3-8: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[ 3413.829768] usb 3-8: Product: ONEv2
[ 3413.829770] usb 3-8: Manufacturer: Apogee
[ 3413.829772] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
[ 3414.421964] usb 3-8: USB disconnect, device number 7
[ 3414.838981] usb 3-8: new high-speed USB device number 8 using xhci_hcd
[ 3415.029947] usb 3-8: New USB device found, idVendor=0c60, 
idProduct=0017, bcdDevice= 1.05
[ 3415.029961] usb 3-8: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[ 3415.029968] usb 3-8: Product: ONEv2
[ 3415.029973] usb 3-8: Manufacturer: Apogee
[ 3415.029978] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
[ 3415.627052] usb 3-8: USB disconnect, device number 8

>>    The messages below are from v5.16.16, but it behaves
>> the same no matter what I plug it into.
>>
>> [  253.708616] usb 3-8: new high-speed USB device number 6 using xhci_hcd
>> [  253.899363] usb 3-8: New USB device found, idVendor=0c60, idProduct=0017,
>> bcdDevice= 1.05
>> [  253.899370] usb 3-8: New USB device strings: Mfr=1, Product=2,
>> SerialNumber=3
>> [  253.899373] usb 3-8: Product: ONEv2
>> [  253.899375] usb 3-8: Manufacturer: Apogee
>> [  253.899377] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
>> [  253.960901] mc: Linux media interface: v0.10
> 
> Any idea where that line came from?

   That's from CONFIG_MEDIA_CONTROLLER, which is selected for usb
webcam.  It also selects CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER.
Compiled it out, rebooted.  Now the line is missing, but no other
change.

> You should try capturing a usbmon trace showing what happens when the
> device is plugged in and then resets.  Preferably on a system where
> snd-usb-audio is disabled.

   Trace from wireshark is attached.

> One other thing you might try: Disable runtime PM for USB ("echo -1
>> /sys/module/usbcore/parameters/autosuspend" before plugging in the
> device).

   Makes no difference -- almost: after few resets it once took much
longer (>10x) to reconnect.


Petr Janecek
--------------GLkwoXh1nemDJrp00ST70qQH
Content-Type: application/x-xz; name="onev2_no_usb_audio.pcapng.xz"
Content-Disposition: attachment; filename="onev2_no_usb_audio.pcapng.xz"
Content-Transfer-Encoding: base64

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
scRn+wIAAAAABFla

--------------GLkwoXh1nemDJrp00ST70qQH--
