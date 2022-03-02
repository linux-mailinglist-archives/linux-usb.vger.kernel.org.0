Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDB404CA846
	for <lists+linux-usb@lfdr.de>; Wed,  2 Mar 2022 15:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243106AbiCBOgd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Mar 2022 09:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237954AbiCBOgc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Mar 2022 09:36:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BD6C4B64
        for <linux-usb@vger.kernel.org>; Wed,  2 Mar 2022 06:35:47 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nPQ4s-00079t-Hm; Wed, 02 Mar 2022 15:35:42 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nPQ4p-0001Zh-PI; Wed, 02 Mar 2022 15:35:39 +0100
Date:   Wed, 2 Mar 2022 15:35:39 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh.Nguyen@synopsys.com
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de, linux-usb@vger.kernel.org
Subject: DWC3 Isoc Gadget Missed Interrupts on Start Transfer
Message-ID: <20220302143539.GI11577@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VaKJWhUROU/xPxjb"
Content-Disposition: inline
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:18:21 up 81 days, 23:03, 88 users,  load average: 0.03, 0.11,
 0.15
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--VaKJWhUROU/xPxjb
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thinh!

I am currently debugging a strange error with transferring isoc requests wi=
th
the current mainline driver.

When the pending and started list is empty the complete interrupt handler is
sending an End Transfer to the controller. This End Transfer will then get
successfully completed.

     irq/50-dwc3-305     [000] d..1.   166.661845: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'End Transfer' [b0d08] params 00000000 00000000 00000000 --> status:=
 Successful
     irq/50-dwc3-305     [000] d..1.   166.661877: dwc3_event: event (080b0=
1d6): ep5in: Endpoint Command Complete
     irq/50-dwc3-305     [000] d..1.   166.661979: dwc3_event: event (482a1=
0d6): ep5in: Transfer Not Ready [0000482a] (Not Active)


After this the Transfer needs to start again. But unfortunately this someti=
mes
does not succeed. You see in the following trace that the Start of the just
prepared trbs did complete with an -18.

    kworker/u5:2-347     [001] d..2.   166.691288: dwc3_prepare_trb: ep5in:=
 trb 000000007ff95a12 (E233:D232) buf 0000ffffffb1c2a8 size 1x 12 ctrl 0000=
0465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691293: dwc3_prepare_trb: ep5in:=
 trb 00000000f9cd175e (E234:D232) buf 0000ffffffb1d000 size 1x 7156 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691313: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Start Transfer' [49140406] params 0000ffff ffff3e80 00000000 --> st=
atus: Bus Expiry
    kworker/u5:2-347     [001] d..2.   166.691327: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Start Transfer' [49150406] params 0000ffff ffff3e80 00000000 --> st=
atus: Successful
    kworker/u5:2-347     [001] d..2.   166.691351: dwc3_prepare_trb: ep5in:=
 trb 00000000207832b0 (E235:D232) buf 0000ffffffb202e8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691356: dwc3_prepare_trb: ep5in:=
 trb 000000007a081501 (E236:D232) buf 0000ffffffb21bf4 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691362: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691384: dwc3_prepare_trb: ep5in:=
 trb 0000000072f4be38 (E237:D232) buf 0000ffffffb24168 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691389: dwc3_prepare_trb: ep5in:=
 trb 00000000596ad302 (E238:D232) buf 0000ffffffb257ec size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691394: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691419: dwc3_prepare_trb: ep5in:=
 trb 00000000b313a087 (E239:D232) buf 0000ffffffb284e8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691423: dwc3_prepare_trb: ep5in:=
 trb 000000000667492d (E240:D232) buf 0000ffffffb293e4 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691429: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691451: dwc3_prepare_trb: ep5in:=
 trb 00000000459ec17b (E241:D232) buf 0000ffffffb305a8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691455: dwc3_prepare_trb: ep5in:=
 trb 00000000f5ca2c22 (E242:D232) buf 0000ffffffb31fdc size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691461: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691483: dwc3_prepare_trb: ep5in:=
 trb 0000000074be44bd (E243:D232) buf 0000ffffffb34b28 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691487: dwc3_prepare_trb: ep5in:=
 trb 000000009b1475ad (E244:D232) buf 0000ffffffb35bd4 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691492: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
     irq/50-dwc3-305     [000] d..1.   166.691502: dwc3_complete_trb: ep5in=
: trb 000000007ff95a12 (E244:D233) buf 0000ffffffb1c2a8 size 1x 0 ctrl 1245=
4464:00004915 (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.691505: dwc3_complete_trb: ep5in=
: trb 00000000f9cd175e (E244:D234) buf 0000ffffffb1d000 size 1x 7168 ctrl 1=
2454470:00004915 (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.691515: dwc3_gadget_giveback: ep=
5in: req 0000000090943319 length 0/7168 zsi =3D=3D> -18
    kworker/u5:2-347     [001] d..2.   166.691525: dwc3_prepare_trb: ep5in:=
 trb 0000000008992ded (E245:D234) buf 0000ffffffe00d68 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691530: dwc3_prepare_trb: ep5in:=
 trb 0000000099db8537 (E246:D234) buf 0000ffffffe017cc size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691535: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691560: dwc3_prepare_trb: ep5in:=
 trb 000000009a32f3df (E247:D234) buf 0000ffffffdfc8e8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691564: dwc3_prepare_trb: ep5in:=
 trb 0000000099e18287 (E248:D234) buf 0000ffffffdfd3c4 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691570: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691593: dwc3_prepare_trb: ep5in:=
 trb 0000000069755327 (E249:D234) buf 0000ffffffdf8e28 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691597: dwc3_prepare_trb: ep5in:=
 trb 00000000b4ea3844 (E250:D234) buf 0000ffffffdf9fbc size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691603: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691626: dwc3_prepare_trb: ep5in:=
 trb 000000004356a51c (E251:D234) buf 0000ffffffdf4f68 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691630: dwc3_prepare_trb: ep5in:=
 trb 0000000005790196 (E252:D234) buf 0000ffffffdf5bb4 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691636: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691657: dwc3_prepare_trb: ep5in:=
 trb 00000000eabf4b9c (E253:D234) buf 0000ffffffdf0ce8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691661: dwc3_prepare_trb: ep5in:=
 trb 00000000e5b7688c (E254:D234) buf 0000ffffffdf17ac size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691667: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691688: dwc3_prepare_trb: ep5in:=
 trb 000000007a2518a4 (E0:D234) buf 0000ffffffdec8a8 size 1x 8 ctrl 0000046=
5:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691693: dwc3_prepare_trb: ep5in:=
 trb 000000005d8805e7 (E1:D234) buf 0000ffffffded3a4 size 1x 7160 ctrl 0000=
0471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691698: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691720: dwc3_prepare_trb: ep5in:=
 trb 00000000b2243432 (E2:D234) buf 0000ffffffde8568 size 1x 8 ctrl 0000046=
5:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691724: dwc3_prepare_trb: ep5in:=
 trb 000000009d420079 (E3:D234) buf 0000ffffffde9f9c size 1x 7160 ctrl 0000=
0471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691730: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691751: dwc3_prepare_trb: ep5in:=
 trb 00000000649fe5d6 (E4:D234) buf 0000ffffff9c8c28 size 1x 8 ctrl 0000046=
5:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691756: dwc3_prepare_trb: ep5in:=
 trb 000000006d01d4b7 (E5:D234) buf 0000ffffff9c9b94 size 1x 7160 ctrl 0000=
0471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691761: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691783: dwc3_prepare_trb: ep5in:=
 trb 00000000a7d5ae23 (E6:D234) buf 0000ffffffbcc368 size 1x 8 ctrl 0000046=
5:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691788: dwc3_prepare_trb: ep5in:=
 trb 00000000f63c85d3 (E7:D234) buf 0000ffffffbcd78c size 1x 7160 ctrl 0000=
0471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691793: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691816: dwc3_prepare_trb: ep5in:=
 trb 00000000893379d8 (E8:D234) buf 0000ffffffbd09a8 size 1x 8 ctrl 0000046=
5:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691820: dwc3_prepare_trb: ep5in:=
 trb 0000000010adff65 (E9:D234) buf 0000ffffffbd1384 size 1x 7160 ctrl 0000=
0c71:00000000 (Hlcs:SC:isoc)
    kworker/u5:2-347     [001] d..2.   166.691826: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691848: dwc3_prepare_trb: ep5in:=
 trb 000000003c91f4e3 (E10:D234) buf 0000ffffffbd47e8 size 1x 8 ctrl 000004=
65:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691852: dwc3_prepare_trb: ep5in:=
 trb 000000001eb9a46d (E11:D234) buf 0000ffffffbd5f7c size 1x 7160 ctrl 000=
00471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691858: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691880: dwc3_prepare_trb: ep5in:=
 trb 000000008039b4f5 (E12:D234) buf 0000ffffffbd80a8 size 1x 8 ctrl 000004=
65:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691884: dwc3_prepare_trb: ep5in:=
 trb 000000003acd9b86 (E13:D234) buf 0000ffffffbd9b74 size 1x 7160 ctrl 000=
00471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691890: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691912: dwc3_prepare_trb: ep5in:=
 trb 0000000016625d76 (E14:D234) buf 0000ffffffbbcc68 size 1x 8 ctrl 000004=
65:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691916: dwc3_prepare_trb: ep5in:=
 trb 000000005060be63 (E15:D234) buf 0000ffffffbbd76c size 1x 7160 ctrl 000=
00471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691922: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691943: dwc3_prepare_trb: ep5in:=
 trb 000000006c7ec562 (E16:D234) buf 0000ffffffbc0768 size 1x 8 ctrl 000004=
65:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691948: dwc3_prepare_trb: ep5in:=
 trb 00000000153e7b58 (E17:D234) buf 0000ffffffbc1364 size 1x 7160 ctrl 000=
00471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691953: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.691975: dwc3_prepare_trb: ep5in:=
 trb 00000000d79e8ccd (E18:D234) buf 0000ffffffbc4f28 size 1x 8 ctrl 000004=
65:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.691979: dwc3_prepare_trb: ep5in:=
 trb 000000002ebdf5db (E19:D234) buf 0000ffffffbc5f5c size 1x 7160 ctrl 000=
00471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.691985: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.692008: dwc3_prepare_trb: ep5in:=
 trb 0000000036246e8f (E20:D234) buf 0000ffffffbc8aa8 size 1x 8 ctrl 000004=
65:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.692012: dwc3_prepare_trb: ep5in:=
 trb 000000000f75f134 (E21:D234) buf 0000ffffffbc9b54 size 1x 7160 ctrl 000=
00471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.692018: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.692040: dwc3_prepare_trb: ep5in:=
 trb 00000000ca9d0693 (E22:D234) buf 0000ffffff9c4528 size 1x 8 ctrl 000004=
65:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.692044: dwc3_prepare_trb: ep5in:=
 trb 000000008587c7c2 (E23:D234) buf 0000ffffff9c574c size 1x 7160 ctrl 000=
00471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.692050: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.692072: dwc3_prepare_trb: ep5in:=
 trb 0000000003ad0d16 (E24:D234) buf 0000ffffff9c07a8 size 1x 8 ctrl 000004=
65:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.692076: dwc3_prepare_trb: ep5in:=
 trb 0000000054e33de9 (E25:D234) buf 0000ffffff9c1344 size 1x 7160 ctrl 000=
00471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.692081: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.692103: dwc3_prepare_trb: ep5in:=
 trb 000000006598a295 (E26:D234) buf 0000ffffff9a0668 size 1x 8 ctrl 000004=
65:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.692108: dwc3_prepare_trb: ep5in:=
 trb 0000000015487935 (E27:D234) buf 0000ffffff9a1f3c size 1x 7160 ctrl 000=
00471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.692114: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.692136: dwc3_prepare_trb: ep5in:=
 trb 00000000ef2871fc (E28:D234) buf 0000ffffff978ea8 size 1x 8 ctrl 000004=
65:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.692140: dwc3_prepare_trb: ep5in:=
 trb 0000000013e0668f (E29:D234) buf 0000ffffff979b34 size 1x 7160 ctrl 000=
00471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.692146: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.692167: dwc3_prepare_trb: ep5in:=
 trb 0000000092e94032 (E30:D234) buf 0000ffffff94c428 size 1x 8 ctrl 000004=
65:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.692172: dwc3_prepare_trb: ep5in:=
 trb 0000000002970903 (E31:D234) buf 0000ffffff94d72c size 1x 7160 ctrl 000=
00471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:2-347     [001] d..2.   166.692177: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:2-347     [001] d..2.   166.692200: dwc3_prepare_trb: ep5in:=
 trb 00000000b3249549 (E32:D234) buf 0000ffffff8bc068 size 1x 8 ctrl 000004=
65:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:2-347     [001] d..2.   166.692205: dwc3_prepare_trb: ep5in:=
 trb 00000000ec88603f (E33:D234) buf 0000ffffff8bd324 size 1x 1221 ctrl 000=
00c71:00000000 (Hlcs:SC:isoc)
    kworker/u5:2-347     [001] d..2.   166.692211: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
     irq/50-dwc3-305     [000] d..1.   166.698763: dwc3_complete_trb: ep5in=
: trb 00000000207832b0 (E33:D235) buf 0000ffffffb202e8 size 1x 0 ctrl 12458=
464:00004916 (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.698766: dwc3_complete_trb: ep5in=
: trb 000000007a081501 (E33:D236) buf 0000ffffffb21bf4 size 1x 7168 ctrl 12=
458470:00004916 (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.698773: dwc3_gadget_giveback: ep=
5in: req 00000000a3af67aa length 0/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.705998: dwc3_complete_trb: ep5in=
: trb 0000000072f4be38 (E33:D237) buf 0000ffffffb24168 size 1x 0 ctrl 1245c=
464:00004917 (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.706002: dwc3_complete_trb: ep5in=
: trb 00000000596ad302 (E33:D238) buf 0000ffffffb257ec size 1x 0 ctrl 1245c=
470:00004917 (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.706008: dwc3_gadget_giveback: ep=
5in: req 00000000efe24442 length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.713228: dwc3_complete_trb: ep5in=
: trb 00000000b313a087 (E33:D239) buf 0000ffffffb284e8 size 1x 0 ctrl 12460=
464:00004918 (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.713231: dwc3_complete_trb: ep5in=
: trb 000000000667492d (E33:D240) buf 0000ffffffb293e4 size 1x 0 ctrl 12460=
470:00004918 (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.713238: dwc3_gadget_giveback: ep=
5in: req 00000000be20abd7 length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.720459: dwc3_complete_trb: ep5in=
: trb 00000000459ec17b (E33:D241) buf 0000ffffffb305a8 size 1x 0 ctrl 12464=
464:00004919 (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.720462: dwc3_complete_trb: ep5in=
: trb 00000000f5ca2c22 (E33:D242) buf 0000ffffffb31fdc size 1x 0 ctrl 12464=
470:00004919 (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.720469: dwc3_gadget_giveback: ep=
5in: req 00000000c7d419e1 length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.727689: dwc3_complete_trb: ep5in=
: trb 0000000074be44bd (E33:D243) buf 0000ffffffb34b28 size 1x 0 ctrl 12468=
464:0000491a (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.727693: dwc3_complete_trb: ep5in=
: trb 000000009b1475ad (E33:D244) buf 0000ffffffb35bd4 size 1x 0 ctrl 12468=
470:0000491a (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.727699: dwc3_gadget_giveback: ep=
5in: req 000000002b31980b length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.734920: dwc3_complete_trb: ep5in=
: trb 0000000008992ded (E33:D245) buf 0000ffffffe00d68 size 1x 0 ctrl 1246c=
464:0000491b (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.734923: dwc3_complete_trb: ep5in=
: trb 0000000099db8537 (E33:D246) buf 0000ffffffe017cc size 1x 0 ctrl 1246c=
470:0000491b (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.734930: dwc3_gadget_giveback: ep=
5in: req 00000000e62a3292 length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.742150: dwc3_complete_trb: ep5in=
: trb 000000009a32f3df (E33:D247) buf 0000ffffffdfc8e8 size 1x 0 ctrl 12470=
464:0000491c (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.742153: dwc3_complete_trb: ep5in=
: trb 0000000099e18287 (E33:D248) buf 0000ffffffdfd3c4 size 1x 0 ctrl 12470=
470:0000491c (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.742161: dwc3_gadget_giveback: ep=
5in: req 00000000ebfe68aa length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.749381: dwc3_complete_trb: ep5in=
: trb 0000000069755327 (E33:D249) buf 0000ffffffdf8e28 size 1x 0 ctrl 12474=
464:0000491d (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.749384: dwc3_complete_trb: ep5in=
: trb 00000000b4ea3844 (E33:D250) buf 0000ffffffdf9fbc size 1x 0 ctrl 12474=
470:0000491d (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.749390: dwc3_gadget_giveback: ep=
5in: req 0000000048685fa4 length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.756611: dwc3_complete_trb: ep5in=
: trb 000000004356a51c (E33:D251) buf 0000ffffffdf4f68 size 1x 0 ctrl 12478=
464:0000491e (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.756614: dwc3_complete_trb: ep5in=
: trb 0000000005790196 (E33:D252) buf 0000ffffffdf5bb4 size 1x 0 ctrl 12478=
470:0000491e (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.756621: dwc3_gadget_giveback: ep=
5in: req 0000000053b4813f length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.763842: dwc3_complete_trb: ep5in=
: trb 00000000eabf4b9c (E33:D253) buf 0000ffffffdf0ce8 size 1x 0 ctrl 1247c=
464:0000491f (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.763845: dwc3_complete_trb: ep5in=
: trb 00000000e5b7688c (E33:D254) buf 0000ffffffdf17ac size 1x 0 ctrl 1247c=
470:0000491f (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.763851: dwc3_gadget_giveback: ep=
5in: req 000000009ccc1e16 length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.771072: dwc3_complete_trb: ep5in=
: trb 000000007a2518a4 (E33:D0) buf 0000ffffffdec8a8 size 1x 0 ctrl 1248046=
4:00004920 (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.771075: dwc3_complete_trb: ep5in=
: trb 000000005d8805e7 (E33:D1) buf 0000ffffffded3a4 size 1x 0 ctrl 1248047=
0:00004920 (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.771081: dwc3_gadget_giveback: ep=
5in: req 000000001170551f length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.778302: dwc3_complete_trb: ep5in=
: trb 00000000b2243432 (E33:D2) buf 0000ffffffde8568 size 1x 0 ctrl 1248446=
4:00004921 (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.778306: dwc3_complete_trb: ep5in=
: trb 000000009d420079 (E33:D3) buf 0000ffffffde9f9c size 1x 0 ctrl 1248447=
0:00004921 (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.778312: dwc3_gadget_giveback: ep=
5in: req 00000000a9695599 length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.785533: dwc3_complete_trb: ep5in=
: trb 00000000649fe5d6 (E33:D4) buf 0000ffffff9c8c28 size 1x 0 ctrl 1248846=
4:00004922 (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.785536: dwc3_complete_trb: ep5in=
: trb 000000006d01d4b7 (E33:D5) buf 0000ffffff9c9b94 size 1x 0 ctrl 1248847=
0:00004922 (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.785545: dwc3_gadget_giveback: ep=
5in: req 0000000073dd58a7 length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.792772: dwc3_complete_trb: ep5in=
: trb 00000000a7d5ae23 (E33:D6) buf 0000ffffffbcc368 size 1x 0 ctrl 1248c46=
4:00004923 (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.792775: dwc3_complete_trb: ep5in=
: trb 00000000f63c85d3 (E33:D7) buf 0000ffffffbcd78c size 1x 0 ctrl 1248c47=
0:00004923 (hlcs:Sc:isoc)
     irq/50-dwc3-305     [000] d..1.   166.792782: dwc3_gadget_giveback: ep=
5in: req 0000000075b98f5a length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.800002: dwc3_complete_trb: ep5in=
: trb 00000000893379d8 (E33:D8) buf 0000ffffffbd09a8 size 1x 0 ctrl 1249046=
4:00004924 (hlCs:Sc:isoc-first)
     irq/50-dwc3-305     [000] d..1.   166.800006: dwc3_complete_trb: ep5in=
: trb 0000000010adff65 (E33:D9) buf 0000ffffffbd1384 size 1x 0 ctrl 12490c7=
0:00004924 (hlcs:SC:isoc)
     irq/50-dwc3-305     [000] d..1.   166.800012: dwc3_gadget_giveback: ep=
5in: req 00000000cd0ff97f length 7168/7168 zsI =3D=3D> -18
     irq/50-dwc3-305     [000] d..1.   166.807238: dwc3_event: event (49168=
096): ep5in: Transfer In Progress [00004916] (siM)
     irq/50-dwc3-305     [000] d..1.   166.807256: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'End Transfer' [b0d08] params 00000000 00000000 00000000 --> status:=
 Successful

The intermediate Bus Expiry is not always present in that case, but also co=
mpletely acceptable as we loop
over the Start Transfer until this succeeds.

Do you have any Idea why this succeeded Start Streaming does come back with=
 an
Missed Transfer on the first trb?

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--VaKJWhUROU/xPxjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmIfgLUACgkQC+njFXoe
LGQKjw/9EpskZFAmbyhjL8iXf+g2NtKfy/PvqW82zkfslT1YOrdYC0OlESAlnKRE
jMYBKgzLV0zl6pBQGRzGzRM+8DPvMooj769+CYmqDF7xMTDIFcGPdpE6kSy2ozta
bWAYAG5oJfqHa8IiUMbbNjVlWEC4wZxtJHOeYRTTSMJHMbAZZnJAwafs7tGdHPBF
WTxSYV4Ov4dfusFg188CkIIF9sMCOXaSP1/u8FURgwE2duhCVbGx9iB3mMxU8rT/
lLiR+Lnwu2xdyIcWhGYEhl3iwv0bWFuLkWz4txE3V+Bdq1dFgMEKbYn18t5PFRAj
U+1t9Vne0xUAYNhqfBOLDSm/h/FimQ0ZeKhhOC8f3x9Jg8mbdmvqDm9n11iIP1tH
Z/Mj6jQ+mNL+Ns+/OTdZFVQRjFfKfxWFh8nS1ConjaXX4kHNsVB6Ig2UPi8sEkAp
xeqHybGyHAW41yTRuKIlQe3TobmyTDgSV7ZtZa6s/TtwimEposBfYj2IaqMt2oOc
PLmNMrTIen4BnfKNe7FczFrPHPZX9h3c3MINeaa20ettVCvqNUJXYWyvjWe6LTMs
2IzhIQHog/RO24S9/c7Hj3eHvta1qvY8oiHJ6Dyu1MIl+9Fx7IUGTLnfJO66M0C7
3DfSsz7we/oRQlcu7CyOPgvy/4HY/KNdotKduAYuAXaP6GUa2gU=
=GRRB
-----END PGP SIGNATURE-----

--VaKJWhUROU/xPxjb--
