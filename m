Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66CA15ABD19
	for <lists+linux-usb@lfdr.de>; Sat,  3 Sep 2022 06:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbiICE51 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Sep 2022 00:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbiICE50 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Sep 2022 00:57:26 -0400
X-Greylist: delayed 353 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 02 Sep 2022 21:57:25 PDT
Received: from juniper.fatooh.org (juniper.fatooh.org [IPv6:2600:3c01:e000:3fa::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5814CDF4F4
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 21:57:25 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by juniper.fatooh.org (Postfix) with ESMTPS id D34E64144B
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 21:51:31 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
        by juniper.fatooh.org (Postfix) with ESMTP id A62FA41450
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 21:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
        :date:mime-version:from:to:subject:content-type
        :content-transfer-encoding; s=dkim; bh=G0byv9ZWV2g/p0DeocbeeZyEr
        9M=; b=CtViEp8ykZEhqoy5L+ToH3VCvrjBKFMFzEYsh4OIyFwwcwgVDd7AeRtaI
        7anZzYMiUx+k7iIB9Mp+YacXvHI1+OYjj+A4NeESB7SDNmeHH+nEf93sfbWbCyzI
        qAhL1q+CxK5v33txp27wVmnW4bdPW1vYJr6RiB7NEpbsOtVGfY=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
        :date:mime-version:from:to:subject:content-type
        :content-transfer-encoding; q=dns; s=dkim; b=YN9OLyfWGgN/2rTWcjM
        t5ws1KuEGZ9PI1u/DNsm6cq/vW1fwbdIVAdPYGqqyEI1A3czzYI1Vvl7kA0X6yf1
        /fwhdqwvuV3nvw80fnuM8sSfv8yyXG6h+CqPunqkCz8Ss6LqD4pSeQrQUFFVthkX
        15veafS2T3x4kryFFmy5t9JQ=
Received: from [198.18.0.3] (unknown [104.184.153.121])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by juniper.fatooh.org (Postfix) with ESMTPSA id 972FC4144B
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 21:51:31 -0700 (PDT)
Message-ID: <250b2c4a-6672-1eee-3c52-ece72e244a91@fatooh.org>
Date:   Fri, 2 Sep 2022 21:51:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
From:   Corey Hickey <bugfood-ml@fatooh.org>
To:     linux-usb@vger.kernel.org
Subject: ASM1351 inconsistent use of uas vs usb-storage
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I have a 5-disk USB-to-SATA enclosure (Sabrent DS-SC5B). I have a mixed
group of disks installed, and I noticed that some of the disks run under
uas and others run under usb-storage.

 From lsusb -t:

/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
     |__ Port 1: Dev 11, If 0, Class=Hub, Driver=hub/4p, 10000M
         |__ Port 2: Dev 13, If 0, Class=Mass Storage, Driver=uas, 10000M
         |__ Port 3: Dev 12, If 0, Class=Hub, Driver=hub/4p, 10000M
             |__ Port 1: Dev 17, If 0, Class=Mass Storage, Driver=usb-storage, 10000M
             |__ Port 2: Dev 16, If 0, Class=Mass Storage, Driver=uas, 10000M
             |__ Port 3: Dev 15, If 0, Class=Mass Storage, Driver=uas, 10000M
             |__ Port 4: Dev 14, If 0, Class=Mass Storage, Driver=usb-storage, 10000M

If I swap drives between ports, the choice of driver changes (it follows
the drive, rather than sticking with the port).


Here are example messages from one of the devices that uses uas
(a 2 TB Seagate ST32000645NS):
[ 1372.937118] usb 4-1.3.3: new SuperSpeed Plus Gen 2x1 USB device number 6 using xhci_hcd
[ 1372.966904] usb 4-1.3.3: New USB device found, idVendor=174c, idProduct=55aa, bcdDevice= 1.00
[ 1372.966911] usb 4-1.3.3: New USB device strings: Mfr=2, Product=3, SerialNumber=1
[ 1372.966914] usb 4-1.3.3: Product: ASM1351
[ 1372.966916] usb 4-1.3.3: Manufacturer: Asmedia
[ 1372.966919] usb 4-1.3.3: SerialNumber: 123456789203
[ 1373.011929] scsi host15: uas
[ 1373.012469] scsi 15:0:0:0: Direct-Access     ASMT     2135             0    PQ: 0 ANSI: 6
[ 1373.013748] sd 15:0:0:0: Attached scsi generic sg10 type 0

Here are example messages from one of the devices that uses usb-storage
(a 12 TB Toshiba HDWG21C):
[ 1368.761102] usb 4-1.3.4: new SuperSpeed Plus Gen 2x1 USB device number 5 using xhci_hcd
[ 1368.791007] usb 4-1.3.4: New USB device found, idVendor=174c, idProduct=55aa, bcdDevice= 1.00
[ 1368.791014] usb 4-1.3.4: New USB device strings: Mfr=2, Product=3, SerialNumber=1
[ 1368.791017] usb 4-1.3.4: Product: ASM1351
[ 1368.791020] usb 4-1.3.4: Manufacturer: Asmedia
[ 1368.791022] usb 4-1.3.4: SerialNumber: 123456789204
[ 1368.803328] usb-storage 4-1.3.4:1.0: USB Mass Storage device detected
[ 1368.803505] usb-storage 4-1.3.4:1.0: Quirks match for vid 174c pid 55aa: 400000
[ 1368.803538] scsi host14: usb-storage 4-1.3.4:1.0
[ 1369.220208] .
[ 1369.829564] scsi 14:0:0:0: Direct-Access     ASMT     2135             0    PQ: 0 ANSI: 6
[ 1369.829783] sd 14:0:0:0: Attached scsi generic sg9 type 0


Why would the old 2 TB Seagate be able to use uas whereas the relatively
new 12 TB Toshiba needs to fall back to usb-storage?

I investigated on my own as far as I could, but didn't find anything
I could understand as definitive (I'm unfamiliar with this code and
with USB in general).


 From the Quirks match to 400000, that seems to be NEEDS_CAP16;
in include/linux/usb_usual.h:

     US_FLAG(NEEDS_CAP16,    0x00400000)         \
         /* cannot handle READ_CAPACITY_10 */        \


The only place I could find where that is set is in
drivers/usb/storage/unusual_devs.h:

UNUSUAL_DEV(  0x174c, 0x55aa, 0x0100, 0x0100,
         "ASMedia",
         "AS2105",
         USB_SC_DEVICE, USB_PR_DEVICE, NULL,
         US_FL_NEEDS_CAP16),

The device I have is an ASM1351, however, not an AS2105. I confirmed that
visually: on the circuit board, there are five chips labeled "ASM1351".

I don't know how relevant that code is, but I think that perhaps the
ASM1351 is being misdetected due to ASMedia re-using the product ID of
0x55aa on different chips. There is some possibly-related code in
drivers/usb/storage/uas-detect.h:

	/*
	 * ASMedia has a number of usb3 to sata bridge chips, at the time of
	 * this writing the following versions exist:
	 * ASM1051 - no uas support version
	 * ASM1051 - with broken (*) uas support
	 * ASM1053 - with working uas support, but problems with large xfers
	 * ASM1153 - with working uas support
	 *
	 * Devices with these chips re-use a number of device-ids over the
	 * entire line, so the device-id is useless to determine if we're
	 * dealing with an ASM1051 (which we want to avoid).
	 *
	 * The ASM1153 can be identified by config.MaxPower == 0,
	 * where as the ASM105x models have config.MaxPower == 36.
	 *
	 * Differentiating between the ASM1053 and ASM1051 is trickier, when
	 * connected over USB-3 we can look at the number of streams supported,
	 * ASM1051 supports 32 streams, where as early ASM1053 versions support
	 * 16 streams, newer ASM1053-s also support 32 streams, but have a
	 * different prod-id.
	 *
	 * (*) ASM1051 chips do work with UAS with some disks (with the
	 *     US_FL_NO_REPORT_OPCODES quirk), but are broken with other disks
	 */
	if (le16_to_cpu(udev->descriptor.idVendor) == 0x174c &&
			(le16_to_cpu(udev->descriptor.idProduct) == 0x5106 ||
			 le16_to_cpu(udev->descriptor.idProduct) == 0x55aa)) {
		if (udev->actconfig->desc.bMaxPower == 0) {
			/* ASM1153, do nothing */
		} else if (udev->speed < USB_SPEED_SUPER) {
			/* No streams info, assume ASM1051 */
			flags |= US_FL_IGNORE_UAS;
		} else if (usb_ss_max_streams(&eps[1]->ss_ep_comp) == 32) {
			/* Possibly an ASM1051, disable uas */
			flags |= US_FL_IGNORE_UAS;
		} else {
			/* ASM1053, these have issues with large transfers */
			flags |= US_FL_MAX_SECTORS_240;
		}
	}



If there is more information I should provide for diagnosis, please let
me know what I should report; I didn't want to fill up this email without
knowing what should be relevant.

Thanks,
Corey
