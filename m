Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 469756436DC
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 22:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbiLEV3F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 16:29:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiLEV3E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 16:29:04 -0500
X-Greylist: delayed 60 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Dec 2022 13:29:01 PST
Received: from h2.cmg2.smtp.forpsi.com (h2.cmg2.smtp.forpsi.com [81.2.195.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4882722B25
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 13:29:01 -0800 (PST)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id 2J0Hp5WkBv5uI2J0Jpubpb; Mon, 05 Dec 2022 22:27:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1670275679; bh=oWlMGj6LctxhNg80a6uY04inF3BmkNnxiTiltMWt1Ok=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=WwkTDwqZB385H8kVwxkXeUFAaPqk+v87p1E2WvVBa1Z1lLsPlMLsFvrVKvguEuq56
         wRPE+LosuV/LhcmbS+tBWpHZ1aA49TdFqMPQdi+9fANC73Ngv7AMhnCmWFnAsz8WqU
         vAaPARMlwRx085hyjMlvmJibpwfOHq75TPctPpj2ERNDFxJ9DtM9WNJCfHLojrx6Yv
         I5PZ8Xe6Dm5kMw4Yd+iJeMoGrlD6U8Pb8Z23jELIt4KkcRvOamHWSNS6NeAYqC2MKk
         Igl8aDUZ1I20RcnUcQOTAPXo3jSLxXrVmbE8jkfZscaZ1uzxwqp9xwEpPPt/c6MbK4
         Y6OVFxXDtqiTg==
Date:   Mon, 5 Dec 2022 22:27:57 +0100
From:   Ladislav Michl <oss-lists@triops.cz>
To:     linux-usb@vger.kernel.org
Subject: xHCI host dies on device unplug
Message-ID: <Y45iXb6VCNiz7ZVd@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfAs1QgWahkejtZC+U20+hr2HTUmZHzIgXe5Ho8DxS+fgwch1evkcCUOY978ombeMjPXahirO+6pqVAZ97RjN3M1twvBHF/e6Jm6+Y6QN1WTId8ZI1RnG
 fcZCRloeL1vH8Gwx6DLMspeuJ40OFvylWmqPZ2ulLSt7+nlIhKl+ONGF
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'm running current linux.git on custom Marvell OCTEON III CN7020
based board. USB devices like FTDI (idVendor=0403, idProduct=6001,
bcdDevice= 6.00) Realtek WiFi dongle (idVendor=0bda, idProduct=8179,
bcdDevice= 0.00) works without issues, while Ralink WiFi dongle 
(idVendor=148f, idProduct=5370, bcdDevice= 1.01) kills the host on
disconnect:
xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command
xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
xhci-hcd xhci-hcd.0.auto: HC died; cleaning up

Unfortunately I do not have a datasheet for CN7020 SoC, so it is hard
to tell if there is any errata :/ In case anyone see a clue in debug
logs bellow, I'll happily give it a try.

Thanks in advance,
	ladis

Realtek unplug:
[ 2098.248876] xhci-hcd xhci-hcd.0.auto: Port change event, 1-1, id 1, portsc: 0x202a0
[ 2098.248908] xhci-hcd xhci-hcd.0.auto: handle_port_status: starting usb1 port polling.
[ 2098.248976] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x202a0, return 0x10100
[ 2098.249020] xhci-hcd xhci-hcd.0.auto: clear port1 connect change, portsc: 0x2a0
[ 2098.249050] usb 1-1: USB disconnect, device number 2
[ 2098.254258] xhci-hcd xhci-hcd.0.auto: xhci_drop_endpoint called for udev 000000006624094f
[ 2098.254416] xhci-hcd xhci-hcd.0.auto: drop ep 0x81, slot id 1, new drop flags = 0x8, new add flags = 0x0
[ 2098.254434] xhci-hcd xhci-hcd.0.auto: xhci_drop_endpoint called for udev 000000006624094f
[ 2098.254489] xhci-hcd xhci-hcd.0.auto: drop ep 0x2, slot id 1, new drop flags = 0x18, new add flags = 0x0
[ 2098.254502] xhci-hcd xhci-hcd.0.auto: xhci_drop_endpoint called for udev 000000006624094f
[ 2098.254555] xhci-hcd xhci-hcd.0.auto: drop ep 0x3, slot id 1, new drop flags = 0x58, new add flags = 0x0
[ 2098.254570] xhci-hcd xhci-hcd.0.auto: xhci_check_bandwidth called for udev 000000006624094f
[ 2098.254598] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[ 2098.254663] xhci-hcd xhci-hcd.0.auto: Successful Endpoint Configure command
[ 2098.255126] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[ 2098.255206] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x2a0, return 0x100
[ 2098.296162] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x2a0, return 0x100
[ 2098.346137] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x2a0, return 0x100
[ 2098.366138] xhci-hcd xhci-hcd.0.auto: xhci_hub_status_data: stopping usb1 port polling
[ 2098.396143] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x2a0, return 0x100
[ 2098.446134] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x2a0, return 0x100

Ralink unplug:
[ 1986.428836] xhci-hcd xhci-hcd.0.auto: Transfer error for slot 1 ep 2 on endpoint
[ 1986.428870] xhci-hcd xhci-hcd.0.auto: Soft-reset ep 2, slot 1
[ 1986.428887] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[ 1986.428909] xhci-hcd xhci-hcd.0.auto: Ignoring reset ep completion code of 1
[ 1986.428925] xhci-hcd xhci-hcd.0.auto: Port change event, 1-1, id 1, portsc: 0x202a0
[ 1986.428941] xhci-hcd xhci-hcd.0.auto: handle_port_status: starting usb1 port polling.
[ 1986.428960] xhci-hcd xhci-hcd.0.auto: Transfer error for slot 1 ep 2 on endpoint
[ 1986.428971] xhci-hcd xhci-hcd.0.auto: Soft-reset ep 2, slot 1
[ 1986.428983] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[ 1986.429001] xhci-hcd xhci-hcd.0.auto: Ignoring reset ep completion code of 1
[ 1986.429044] xhci-hcd xhci-hcd.0.auto: Transfer error for slot 1 ep 2 on endpoint
[ 1986.429057] xhci-hcd xhci-hcd.0.auto: Soft-reset ep 2, slot 1
[ 1986.429069] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[ 1986.429087] xhci-hcd xhci-hcd.0.auto: Ignoring reset ep completion code of 1
[ 1986.429110] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x202a0, return 0x10100
[ 1986.429151] xhci-hcd xhci-hcd.0.auto: clear port1 connect change, portsc: 0x2a0
[ 1986.429183] usb 1-1: USB disconnect, device number 2
[ 1986.434497] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000087ce5b92, dev 1, ep 0x81, starting at offset 0x3608010
[ 1986.434524] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[ 1986.434541] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000e2bdabe5, dev 1, ep 0x81, starting at offset 0x3608000
[ 1986.434564] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000e5c97d1e, dev 1, ep 0x81, starting at offset 0x33defe0
[ 1986.434586] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000e1366a9f, dev 1, ep 0x81, starting at offset 0x33defd0
[ 1986.434608] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000001796da21, dev 1, ep 0x81, starting at offset 0x33defc0
[ 1986.434631] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000f4822c30, dev 1, ep 0x81, starting at offset 0x33defb0
[ 1986.434653] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000aad33945, dev 1, ep 0x81, starting at offset 0x33defa0
[ 1986.434676] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000719a057f, dev 1, ep 0x81, starting at offset 0x33def90
[ 1986.434698] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000085cdfba1, dev 1, ep 0x81, starting at offset 0x33def80
[ 1986.434721] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000d2054ee7, dev 1, ep 0x81, starting at offset 0x33def70
[ 1986.434743] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000038a19f4d, dev 1, ep 0x81, starting at offset 0x33def60
[ 1986.434765] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000005a5b1dc, dev 1, ep 0x81, starting at offset 0x33def50
[ 1986.434788] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000a7d193da, dev 1, ep 0x81, starting at offset 0x33def40
[ 1986.434810] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000503a6bc6, dev 1, ep 0x81, starting at offset 0x33def30
[ 1986.434832] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000072f9c492, dev 1, ep 0x81, starting at offset 0x33def20
[ 1986.434855] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000885423dd, dev 1, ep 0x81, starting at offset 0x33def10
[ 1986.434877] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000007ee71ced, dev 1, ep 0x81, starting at offset 0x33def00
[ 1986.434899] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000006e835c64, dev 1, ep 0x81, starting at offset 0x33deef0
[ 1986.434922] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000005e097df4, dev 1, ep 0x81, starting at offset 0x33deee0
[ 1986.434945] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000074d993b4, dev 1, ep 0x81, starting at offset 0x33deed0
[ 1986.434968] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000035337e11, dev 1, ep 0x81, starting at offset 0x33deec0
[ 1986.434991] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000006b832515, dev 1, ep 0x81, starting at offset 0x33deeb0
[ 1986.435014] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000002a113a6, dev 1, ep 0x81, starting at offset 0x33deea0
[ 1986.435037] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000086977dbf, dev 1, ep 0x81, starting at offset 0x33dee90
[ 1986.435060] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000dd1534c8, dev 1, ep 0x81, starting at offset 0x33dee80
[ 1986.435083] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000080dbc56e, dev 1, ep 0x81, starting at offset 0x33dee70
[ 1986.435106] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000169c09dd, dev 1, ep 0x81, starting at offset 0x33dee60
[ 1986.435128] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000e791ce73, dev 1, ep 0x81, starting at offset 0x33dee50
[ 1986.435152] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000002b11a66b, dev 1, ep 0x81, starting at offset 0x33dee40
[ 1986.435174] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000011fb0d96, dev 1, ep 0x81, starting at offset 0x33dee30
[ 1986.435197] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000340e5152, dev 1, ep 0x81, starting at offset 0x33dee20
[ 1986.435220] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000008c39d2de, dev 1, ep 0x81, starting at offset 0x33dee10
[ 1986.435243] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000a7e4e6c8, dev 1, ep 0x81, starting at offset 0x33dee00
[ 1986.435266] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000038be34b1, dev 1, ep 0x81, starting at offset 0x33dedf0
[ 1986.435289] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000071b6669e, dev 1, ep 0x81, starting at offset 0x33dede0
[ 1986.435312] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000879ff7e6, dev 1, ep 0x81, starting at offset 0x33dedd0
[ 1986.435335] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000001ce59c92, dev 1, ep 0x81, starting at offset 0x33dedc0
[ 1986.435358] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000024b7c567, dev 1, ep 0x81, starting at offset 0x33dedb0
[ 1986.435381] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000009e7a6d13, dev 1, ep 0x81, starting at offset 0x33deda0
[ 1986.435404] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000052cf0b08, dev 1, ep 0x81, starting at offset 0x33ded90
[ 1986.435426] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000071a915eb, dev 1, ep 0x81, starting at offset 0x33ded80
[ 1986.435450] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000ad41adfd, dev 1, ep 0x81, starting at offset 0x33ded70
[ 1986.435473] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000169a02cd, dev 1, ep 0x81, starting at offset 0x33ded60
[ 1986.435496] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000042fe4cb4, dev 1, ep 0x81, starting at offset 0x33ded50
[ 1986.435519] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000005668964c, dev 1, ep 0x81, starting at offset 0x33ded40
[ 1986.435542] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000a94112fa, dev 1, ep 0x81, starting at offset 0x33ded30
[ 1986.435565] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000793157b9, dev 1, ep 0x81, starting at offset 0x33ded20
[ 1986.435588] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000027e729da, dev 1, ep 0x81, starting at offset 0x33ded10
[ 1986.435611] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000053cf18d1, dev 1, ep 0x81, starting at offset 0x33ded00
[ 1986.435634] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000ac4b3a0b, dev 1, ep 0x81, starting at offset 0x33decf0
[ 1986.435657] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000005e814c9, dev 1, ep 0x81, starting at offset 0x33dece0
[ 1986.435680] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000000aceab7a, dev 1, ep 0x81, starting at offset 0x33decd0
[ 1986.435703] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000007e9fedea, dev 1, ep 0x81, starting at offset 0x33decc0
[ 1986.435726] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000004aff6c6, dev 1, ep 0x81, starting at offset 0x33decb0
[ 1986.435749] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000004a3772f8, dev 1, ep 0x81, starting at offset 0x33deca0
[ 1986.435772] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000003fb90d46, dev 1, ep 0x81, starting at offset 0x33dec90
[ 1986.435795] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000002f147a2c, dev 1, ep 0x81, starting at offset 0x33dec80
[ 1986.435818] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000c081722c, dev 1, ep 0x81, starting at offset 0x33dec70
[ 1986.435841] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000bb50a072, dev 1, ep 0x81, starting at offset 0x33dec60
[ 1986.435864] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000dc942c38, dev 1, ep 0x81, starting at offset 0x33dec50
[ 1986.435887] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000399e44af, dev 1, ep 0x81, starting at offset 0x33dec40
[ 1986.435910] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000074145ea1, dev 1, ep 0x81, starting at offset 0x33dec30
[ 1986.435933] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000077d0fc69, dev 1, ep 0x81, starting at offset 0x33dec20
[ 1986.435956] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000818556d0, dev 1, ep 0x81, starting at offset 0x33dec10
[ 1986.435979] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000005ffb65ee, dev 1, ep 0x81, starting at offset 0x33dec00
[ 1986.436002] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000058560f70, dev 1, ep 0x81, starting at offset 0x33debf0
[ 1986.436025] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000007500c333, dev 1, ep 0x81, starting at offset 0x33debe0
[ 1986.436049] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000d3ea0c58, dev 1, ep 0x81, starting at offset 0x33debd0
[ 1986.436072] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000c0ad548d, dev 1, ep 0x81, starting at offset 0x33debc0
[ 1986.436095] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000b5bce8dc, dev 1, ep 0x81, starting at offset 0x33debb0
[ 1986.436119] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000080ad47a2, dev 1, ep 0x81, starting at offset 0x33deba0
[ 1986.436141] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000afe91c88, dev 1, ep 0x81, starting at offset 0x33deb90
[ 1986.436165] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000bef1a77f, dev 1, ep 0x81, starting at offset 0x33deb80
[ 1986.436188] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000060641efb, dev 1, ep 0x81, starting at offset 0x33deb70
[ 1986.436210] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000fe383ea0, dev 1, ep 0x81, starting at offset 0x33deb60
[ 1986.436234] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000263aab2a, dev 1, ep 0x81, starting at offset 0x33deb50
[ 1986.436257] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000094ee9ddc, dev 1, ep 0x81, starting at offset 0x33deb40
[ 1986.436280] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000c165ca7f, dev 1, ep 0x81, starting at offset 0x33deb30
[ 1986.436303] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000049f3171f, dev 1, ep 0x81, starting at offset 0x33deb20
[ 1986.436326] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000008827f3d8, dev 1, ep 0x81, starting at offset 0x33deb10
[ 1986.436349] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000a3dfc9a3, dev 1, ep 0x81, starting at offset 0x33deb00
[ 1986.436372] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000076416362, dev 1, ep 0x81, starting at offset 0x33deaf0
[ 1986.436395] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000000ed8362a, dev 1, ep 0x81, starting at offset 0x33deae0
[ 1986.436418] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000fda2f676, dev 1, ep 0x81, starting at offset 0x33dead0
[ 1986.436442] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000f4e275bd, dev 1, ep 0x81, starting at offset 0x33deac0
[ 1986.436465] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000bb5c59c8, dev 1, ep 0x81, starting at offset 0x33deab0
[ 1986.436488] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000000022b038, dev 1, ep 0x81, starting at offset 0x33deaa0
[ 1986.436511] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000554027f2, dev 1, ep 0x81, starting at offset 0x33dea90
[ 1986.436534] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000325c83eb, dev 1, ep 0x81, starting at offset 0x33dea80
[ 1986.436557] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000015185d0, dev 1, ep 0x81, starting at offset 0x33dea70
[ 1986.436580] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000a0929014, dev 1, ep 0x81, starting at offset 0x33dea60
[ 1986.436603] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000092d02943, dev 1, ep 0x81, starting at offset 0x33dea50
[ 1986.436626] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000adbeaec3, dev 1, ep 0x81, starting at offset 0x33dea40
[ 1986.436649] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000dce3916e, dev 1, ep 0x81, starting at offset 0x33dea30
[ 1986.436672] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000095f83baa, dev 1, ep 0x81, starting at offset 0x33dea20
[ 1986.436696] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000051abed95, dev 1, ep 0x81, starting at offset 0x33dea10
[ 1986.436719] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000e094b119, dev 1, ep 0x81, starting at offset 0x33dea00
[ 1986.436742] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000f56e14a0, dev 1, ep 0x81, starting at offset 0x33de9f0
[ 1986.436765] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000b56141ae, dev 1, ep 0x81, starting at offset 0x33de9e0
[ 1986.436788] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000003bdac46c, dev 1, ep 0x81, starting at offset 0x33de9d0
[ 1986.436812] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000008bfa7c31, dev 1, ep 0x81, starting at offset 0x33de9c0
[ 1986.436835] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000004917587e, dev 1, ep 0x81, starting at offset 0x33de9b0
[ 1986.436858] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000f7bf3d5f, dev 1, ep 0x81, starting at offset 0x33de9a0
[ 1986.436882] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000dd67b308, dev 1, ep 0x81, starting at offset 0x33de990
[ 1986.436905] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000003402ee4f, dev 1, ep 0x81, starting at offset 0x33de980
[ 1986.436928] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000b5f3339b, dev 1, ep 0x81, starting at offset 0x33de970
[ 1986.436952] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000049badb68, dev 1, ep 0x81, starting at offset 0x33de960
[ 1986.436975] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000001ab821c3, dev 1, ep 0x81, starting at offset 0x33de950
[ 1986.436998] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000093a46dfd, dev 1, ep 0x81, starting at offset 0x33de940
[ 1986.437021] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000002100ec31, dev 1, ep 0x81, starting at offset 0x33de930
[ 1986.437045] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000072ebb406, dev 1, ep 0x81, starting at offset 0x33de920
[ 1986.437068] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000b88ea70f, dev 1, ep 0x81, starting at offset 0x33de910
[ 1986.437092] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000004890db1d, dev 1, ep 0x81, starting at offset 0x33de900
[ 1986.437115] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000038ea1620, dev 1, ep 0x81, starting at offset 0x33de8f0
[ 1986.437139] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000004c5ee804, dev 1, ep 0x81, starting at offset 0x33de8e0
[ 1986.437162] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000054318f40, dev 1, ep 0x81, starting at offset 0x33de8d0
[ 1986.437185] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000006990e910, dev 1, ep 0x81, starting at offset 0x33de8c0
[ 1986.437208] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000690000fb, dev 1, ep 0x81, starting at offset 0x33de8b0
[ 1986.437232] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000007ed3f455, dev 1, ep 0x81, starting at offset 0x33de8a0
[ 1986.437255] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000037748511, dev 1, ep 0x81, starting at offset 0x33de890
[ 1986.437279] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000dc1df57c, dev 1, ep 0x81, starting at offset 0x33de880
[ 1986.437302] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000059be9c5c, dev 1, ep 0x81, starting at offset 0x33de870
[ 1986.437326] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000e0c1c62f, dev 1, ep 0x81, starting at offset 0x33de860
[ 1986.437349] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000ff658f84, dev 1, ep 0x81, starting at offset 0x33de850
[ 1986.437372] xhci-hcd xhci-hcd.0.auto: Cancel URB 0000000081fd6936, dev 1, ep 0x81, starting at offset 0x33de840
[ 1986.437396] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000226f9456, dev 1, ep 0x81, starting at offset 0x33de830
[ 1986.437419] xhci-hcd xhci-hcd.0.auto: Cancel URB 000000008225fe78, dev 1, ep 0x81, starting at offset 0x33de820
[ 1986.437442] xhci-hcd xhci-hcd.0.auto: Cancel URB 00000000afb20453, dev 1, ep 0x81, starting at offset 0x33de810
[ 1986.616126] xhci-hcd xhci-hcd.0.auto: xhci_hub_status_data: stopping usb1 port polling
[ 1988.146176] ieee80211 phy1: rt2x00usb_vendor_request: Error - Vendor Request 0x07 failed for offset 0x1328 with error -19
[ 1991.506142] xhci-hcd xhci-hcd.0.auto: Command timeout, USBSTS: 0x00000000
[ 1991.506168] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command
[ 1991.514185] xhci-hcd xhci-hcd.0.auto: // Halt the HC
[ 1991.534359] xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
[ 1991.542284] xhci-hcd xhci-hcd.0.auto: Killing URBs for slot ID 1, ep index 0
[ 1991.542298] xhci-hcd xhci-hcd.0.auto: Killing URBs for slot ID 1, ep index 1
[ 1991.542310] xhci-hcd xhci-hcd.0.auto: Killing URBs for slot ID 1, ep index 2
[ 1991.542451] xhci-hcd xhci-hcd.0.auto: Killing URBs for slot ID 1, ep index 3
[ 1991.542465] xhci-hcd xhci-hcd.0.auto: Killing URBs for slot ID 1, ep index 5
[ 1991.542477] xhci-hcd xhci-hcd.0.auto: Killing URBs for slot ID 1, ep index 7
[ 1991.542489] xhci-hcd xhci-hcd.0.auto: Killing URBs for slot ID 1, ep index 9
[ 1991.542502] xhci-hcd xhci-hcd.0.auto: Killing URBs for slot ID 1, ep index 11
[ 1991.542520] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
