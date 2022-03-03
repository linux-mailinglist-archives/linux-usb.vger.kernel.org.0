Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E28054CBC3C
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 12:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbiCCLQX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 06:16:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbiCCLQV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 06:16:21 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECBA215C66A
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 03:15:32 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nPjQd-00009p-JK; Thu, 03 Mar 2022 12:15:27 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nPjQc-0006n6-Df; Thu, 03 Mar 2022 12:15:26 +0100
Date:   Thu, 3 Mar 2022 12:15:26 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: DWC3 Isoc Gadget Missed Interrupts on Start Transfer
Message-ID: <20220303111526.GJ11577@pengutronix.de>
References: <20220302143539.GI11577@pengutronix.de>
 <73c5e6b4-8f68-9a6e-33e4-0c49c291ad94@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QxN5xOWGsmh5a4wb"
Content-Disposition: inline
In-Reply-To: <73c5e6b4-8f68-9a6e-33e4-0c49c291ad94@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:03:28 up 82 days, 19:49, 84 users,  load average: 0.25, 0.32,
 0.24
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--QxN5xOWGsmh5a4wb
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2022 at 10:22:55PM +0000, Thinh Nguyen wrote:
>Michael Grzeschik wrote:
>> I am currently debugging a strange error with transferring isoc requests
>> with
>> the current mainline driver.
>>
>> When the pending and started list is empty the complete interrupt
>> handler is
>> sending an End Transfer to the controller. This End Transfer will then g=
et
>> successfully completed.
>>
>> =A0=A0=A0 irq/50-dwc3-305=A0=A0=A0=A0 [000] d..1.=A0=A0 166.661845: dwc3=
_gadget_ep_cmd:
>> ep5in: cmd 'End Transfer' [b0d08] params 00000000 00000000 00000000 -->
>> status: Successful
>> =A0=A0=A0 irq/50-dwc3-305=A0=A0=A0=A0 [000] d..1.=A0=A0 166.661877: dwc3=
_event: event
>> (080b01d6): ep5in: Endpoint Command Complete
>> =A0=A0=A0 irq/50-dwc3-305=A0=A0=A0=A0 [000] d..1.=A0=A0 166.661979: dwc3=
_event: event
>> (482a10d6): ep5in: Transfer Not Ready [0000482a] (Not Active)
>>
>>
>> After this the Transfer needs to start again. But unfortunately this
>> sometimes
>> does not succeed. You see in the following trace that the Start of the j=
ust
>> prepared trbs did complete with an -18.
>>
>> =A0=A0 kworker/u5:2-347=A0=A0=A0=A0 [001] d..2.=A0=A0 166.691288: dwc3_p=
repare_trb:
>> ep5in: trb 000000007ff95a12 (E233:D232) buf 0000ffffffb1c2a8 size 1x 12
>> ctrl 00000465:00000000 (HlCs:Sc:isoc-first)
>> =A0=A0 kworker/u5:2-347=A0=A0=A0=A0 [001] d..2.=A0=A0 166.691293: dwc3_p=
repare_trb:
>> ep5in: trb 00000000f9cd175e (E234:D232) buf 0000ffffffb1d000 size 1x
>> 7156 ctrl 00000471:00000000 (Hlcs:Sc:isoc)

[snip]

>>
>> The intermediate Bus Expiry is not always present in that case, but also
>> completely acceptable as we loop
>> over the Start Transfer until this succeeds.
>>
>> Do you have any Idea why this succeeded Start Streaming does come back
>> with an
>> Missed Transfer on the first trb?
>>
>
>Hi Michael,
>
>When sending the trace, please leave it unfiltered. It's missing some
>trace events that I want to check.

Right, it was a mix of trace_event:dwc3:* and ftrace_filter=3Ddwc*. So I
kind of felt filtering out the interesting part would help.

Anyway. Here is the same situation in another trace, with all
trace_events from dwc3:

     ...
     irq/50-dwc3-317     [000] d..1.   303.270329: dwc3_complete_trb: ep5in=
: trb 000000002b7860b1 (E110:D109) buf 0000ffffff8b07a8 size 1x 0 ctrl 3a66=
0464:0000e998 (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.270331: dwc3_complete_trb: ep5in=
: trb 000000007bd5c03d (E110:D110) buf 0000ffffff8b1b34 size 1x 0 ctrl 3a66=
0c70:0000e998 (hlcs:SC:isoc)
     irq/50-dwc3-317     [000] d..1.   303.270336: dwc3_gadget_giveback: ep=
5in: req 000000005332cdd2 length 1146/1146 zsI =3D=3D> 0
     irq/50-dwc3-317     [000] d..1.   303.270349: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
     irq/50-dwc3-317     [000] d..1.   303.270350: dwc3_writel: addr 000000=
00980f66dc offset 0008 value 00000000
     irq/50-dwc3-317     [000] d..1.   303.270351: dwc3_writel: addr 000000=
00e5d226be offset 0004 value 00000000
     irq/50-dwc3-317     [000] d..1.   303.270352: dwc3_writel: addr 000000=
00cd12f6fc offset 0000 value 00000000
     irq/50-dwc3-317     [000] d..1.   303.270353: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0d08
     irq/50-dwc3-317     [000] d..1.   303.270354: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0908
     irq/50-dwc3-317     [000] d..1.   303.270355: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'End Transfer' [b0d08] params 00000000 00000000 00000000 --> status:=
 Successful
     irq/50-dwc3-317     [000] d..1.   303.270357: dwc3_writel: addr 000000=
0077945c0a offset c408 value 00001000
     irq/50-dwc3-317     [000] d.h1.   303.270369: dwc3_readl: addr 0000000=
073cc91b4 offset c40c value 00000004
     irq/50-dwc3-317     [000] d.h1.   303.270370: dwc3_writel: addr 000000=
0077945c0a offset c408 value 80001000
     irq/50-dwc3-317     [000] d.h1.   303.270371: dwc3_writel: addr 000000=
0073cc91b4 offset c40c value 00000004
     irq/50-dwc3-317     [000] d..1.   303.270384: dwc3_event: event (080b0=
1d6): ep5in: Endpoint Command Complete
     irq/50-dwc3-317     [000] d..1.   303.270386: dwc3_writel: addr 000000=
0077945c0a offset c408 value 00001000
          <idle>-0       [000] d.h1.   303.270434: dwc3_readl: addr 0000000=
073cc91b4 offset c40c value 00000004
          <idle>-0       [000] d.h1.   303.270436: dwc3_writel: addr 000000=
0077945c0a offset c408 value 80001000
          <idle>-0       [000] d.h1.   303.270437: dwc3_writel: addr 000000=
0073cc91b4 offset c40c value 00000004
     irq/50-dwc3-317     [000] d..1.   303.270453: dwc3_event: event (e99a1=
0d6): ep5in: Transfer Not Ready [0000e99a] (Not Active)
     irq/50-dwc3-317     [000] d..1.   303.270454: dwc3_writel: addr 000000=
0077945c0a offset c408 value 00001000
    kworker/u5:0-103     [001] d..1.   303.300147: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 0083543c
    kworker/u5:0-103     [001] d..2.   303.300153: dwc3_ep_queue: ep5in: re=
q 00000000ebdd96ce length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300156: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 0083543c
    kworker/u5:0-103     [001] d..2.   303.300167: dwc3_prepare_trb: ep5in:=
 trb 00000000dfee81a1 (E111:D110) buf 0000ffffffb1ca28 size 1x 12 ctrl 0000=
0465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300169: dwc3_prepare_trb: ep5in:=
 trb 00000000985156de (E112:D110) buf 0000ffffffb1d000 size 1x 7156 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300172: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300173: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 0083543c
    kworker/u5:0-103     [001] d..2.   303.300174: dwc3_writel: addr 000000=
00980f66dc offset 0008 value 0000ffff
    kworker/u5:0-103     [001] d..2.   303.300175: dwc3_writel: addr 000000=
00e5d226be offset 0004 value ffff36e0
    kworker/u5:0-103     [001] d..2.   303.300176: dwc3_writel: addr 000000=
00cd12f6fc offset 0000 value 00000000
    kworker/u5:0-103     [001] d..2.   303.300177: dwc3_writel: addr 000000=
005a3de08f offset 000c value ea880c06
    kworker/u5:0-103     [001] d..2.   303.300178: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0806
    kworker/u5:0-103     [001] d..2.   303.300181: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Start Transfer' [ea880c06] params 0000ffff ffff36e0 00000000 --> st=
atus: Successful
    kworker/u5:0-103     [001] d..2.   303.300182: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0806
    kworker/u5:0-103     [001] d..1.   303.300190: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035444
    kworker/u5:0-103     [001] d..2.   303.300192: dwc3_ep_queue: ep5in: re=
q 0000000051b03a63 length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300199: dwc3_prepare_trb: ep5in:=
 trb 0000000030bedaf0 (E113:D110) buf 0000ffffffb18d28 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300201: dwc3_prepare_trb: ep5in:=
 trb 000000009cea9eeb (E114:D110) buf 0000ffffffb19bf4 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300202: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300203: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300205: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300205: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300212: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035444
    kworker/u5:0-103     [001] d..2.   303.300214: dwc3_ep_queue: ep5in: re=
q 00000000b5e8c200 length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300220: dwc3_prepare_trb: ep5in:=
 trb 0000000067df777d (E115:D110) buf 0000ffffffa6c968 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300222: dwc3_prepare_trb: ep5in:=
 trb 0000000027dc06f7 (E116:D110) buf 0000ffffffa6d7ec size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300224: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300225: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300226: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300227: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300234: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035444
    kworker/u5:0-103     [001] d..2.   303.300236: dwc3_ep_queue: ep5in: re=
q 000000008ba09979 length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300242: dwc3_prepare_trb: ep5in:=
 trb 00000000e92e3cbd (E117:D110) buf 0000ffffffb58568 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300244: dwc3_prepare_trb: ep5in:=
 trb 0000000008efb276 (E118:D110) buf 0000ffffffb593e4 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300245: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300246: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300248: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300248: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300256: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035444
    kworker/u5:0-103     [001] d..2.   303.300258: dwc3_ep_queue: ep5in: re=
q 00000000fc26cabb length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300264: dwc3_prepare_trb: ep5in:=
 trb 00000000634dffa2 (E119:D110) buf 0000ffffffb745a8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300266: dwc3_prepare_trb: ep5in:=
 trb 00000000544b5d11 (E120:D110) buf 0000ffffffb75fdc size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300268: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300269: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300270: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300271: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300278: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035444
    kworker/u5:0-103     [001] d..2.   303.300280: dwc3_ep_queue: ep5in: re=
q 000000004e112f8f length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300285: dwc3_prepare_trb: ep5in:=
 trb 0000000055a06d19 (E121:D110) buf 0000ffffffb782e8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300287: dwc3_prepare_trb: ep5in:=
 trb 00000000221e87a1 (E122:D110) buf 0000ffffffb79bd4 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300289: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300293: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300294: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300295: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300302: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035444
    kworker/u5:0-103     [001] d..2.   303.300304: dwc3_ep_queue: ep5in: re=
q 00000000a77632f8 length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300309: dwc3_prepare_trb: ep5in:=
 trb 00000000b0827538 (E123:D110) buf 0000ffffffb7ca68 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    pipewire:src-350     [000] d.h..   303.300310: dwc3_readl: addr 0000000=
073cc91b4 offset c40c value 00000008
    kworker/u5:0-103     [001] d..2.   303.300312: dwc3_prepare_trb: ep5in:=
 trb 0000000007c04114 (E124:D110) buf 0000ffffffb7d7cc size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    pipewire:src-350     [000] d.h..   303.300312: dwc3_writel: addr 000000=
0077945c0a offset c408 value 80001000
    kworker/u5:0-103     [001] d..2.   303.300313: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    pipewire:src-350     [000] d.h..   303.300314: dwc3_writel: addr 000000=
0073cc91b4 offset c40c value 00000008
    kworker/u5:0-103     [001] d..2.   303.300314: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300315: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300316: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300323: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 0003544c
    kworker/u5:0-103     [001] d..2.   303.300325: dwc3_ep_queue: ep5in: re=
q 000000009d99afac length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300331: dwc3_prepare_trb: ep5in:=
 trb 000000005394448b (E125:D110) buf 0000ffffffb80ba8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300333: dwc3_prepare_trb: ep5in:=
 trb 000000004361b6ec (E126:D110) buf 0000ffffffb813c4 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300335: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300336: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300337: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300338: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
     irq/50-dwc3-317     [000] d..1.   303.300340: dwc3_event: event (ea888=
096): ep5in: Transfer In Progress [0000ea88] (siM)
     irq/50-dwc3-317     [000] d..1.   303.300343: dwc3_complete_trb: ep5in=
: trb 00000000dfee81a1 (E126:D111) buf 0000ffffffb1ca28 size 1x 0 ctrl 3aa2=
0464:0000ea88 (hlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..1.   303.300345: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 0003544c
     irq/50-dwc3-317     [000] d..1.   303.300345: dwc3_complete_trb: ep5in=
: trb 00000000985156de (E126:D112) buf 0000ffffffb1d000 size 1x 7168 ctrl 3=
aa20470:0000ea88 (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.300354: dwc3_gadget_giveback: ep=
5in: req 00000000ebdd96ce length 0/7168 zsi =3D=3D> -18
    kworker/u5:0-103     [001] d..2.   303.300356: dwc3_ep_queue: ep5in: re=
q 00000000b27ec36b length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300362: dwc3_prepare_trb: ep5in:=
 trb 000000000fc782b8 (E127:D112) buf 0000ffffffb84828 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300364: dwc3_prepare_trb: ep5in:=
 trb 00000000f594423f (E128:D112) buf 0000ffffffb85fbc size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300365: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300366: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300367: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300368: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300375: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 0003544c
    kworker/u5:0-103     [001] d..2.   303.300378: dwc3_ep_queue: ep5in: re=
q 000000007b6ed6f3 length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300383: dwc3_prepare_trb: ep5in:=
 trb 00000000391b49ab (E129:D112) buf 0000ffffffb889a8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300386: dwc3_prepare_trb: ep5in:=
 trb 00000000979d3c23 (E130:D112) buf 0000ffffffb89bb4 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300388: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300389: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300390: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300391: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300398: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 0003544c
    kworker/u5:0-103     [001] d..2.   303.300401: dwc3_ep_queue: ep5in: re=
q 00000000bc2b6c4d length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300408: dwc3_prepare_trb: ep5in:=
 trb 000000007ab7715a (E131:D112) buf 0000ffffffb8c0a8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300410: dwc3_prepare_trb: ep5in:=
 trb 00000000217c7be7 (E132:D112) buf 0000ffffffb8d7ac size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300412: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300413: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300414: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300415: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300422: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 0003544c
    kworker/u5:0-103     [001] d..2.   303.300424: dwc3_ep_queue: ep5in: re=
q 00000000f8f3eb0d length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300430: dwc3_prepare_trb: ep5in:=
 trb 00000000907e85e1 (E133:D112) buf 0000ffffffb90928 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300432: dwc3_prepare_trb: ep5in:=
 trb 00000000bb860433 (E134:D112) buf 0000ffffffb913a4 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300434: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300435: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300436: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300437: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300444: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035454
    kworker/u5:0-103     [001] d..2.   303.300446: dwc3_ep_queue: ep5in: re=
q 00000000ab8d9880 length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300451: dwc3_prepare_trb: ep5in:=
 trb 00000000c0003d17 (E135:D112) buf 0000ffffffb94528 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300453: dwc3_prepare_trb: ep5in:=
 trb 00000000b03c9834 (E136:D112) buf 0000ffffffb95f9c size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300455: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300456: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300457: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300458: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300465: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035454
    kworker/u5:0-103     [001] d..2.   303.300467: dwc3_ep_queue: ep5in: re=
q 00000000d4dc2a9c length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300473: dwc3_prepare_trb: ep5in:=
 trb 00000000c55d236b (E137:D112) buf 0000ffffffb98ca8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300475: dwc3_prepare_trb: ep5in:=
 trb 0000000079a7319b (E138:D112) buf 0000ffffffb99b94 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300477: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300478: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300479: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300480: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300487: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035454
    kworker/u5:0-103     [001] d..2.   303.300489: dwc3_ep_queue: ep5in: re=
q 000000002268e4db length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300494: dwc3_prepare_trb: ep5in:=
 trb 0000000066932860 (E139:D112) buf 0000ffffffae88a8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300496: dwc3_prepare_trb: ep5in:=
 trb 0000000062d70129 (E140:D112) buf 0000ffffffae978c size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300498: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300499: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300501: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300501: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300508: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035454
    kworker/u5:0-103     [001] d..2.   303.300510: dwc3_ep_queue: ep5in: re=
q 00000000e5c4f08a length 0/7168 zsI =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300516: dwc3_prepare_trb: ep5in:=
 trb 00000000c7f30d08 (E141:D112) buf 0000ffffffb20da8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300518: dwc3_prepare_trb: ep5in:=
 trb 000000009ee7250a (E142:D112) buf 0000ffffffb21384 size 1x 7160 ctrl 00=
000c71:00000000 (Hlcs:SC:isoc)
    kworker/u5:0-103     [001] d..2.   303.300520: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300521: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300522: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300523: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300529: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035454
    kworker/u5:0-103     [001] d..2.   303.300531: dwc3_ep_queue: ep5in: re=
q 00000000d325210d length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300537: dwc3_prepare_trb: ep5in:=
 trb 0000000092da83c7 (E143:D112) buf 0000ffffffb24768 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300539: dwc3_prepare_trb: ep5in:=
 trb 00000000edd8fc2d (E144:D112) buf 0000ffffffb25f7c size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300541: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300542: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300543: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300544: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300550: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035454
    kworker/u5:0-103     [001] d..2.   303.300553: dwc3_ep_queue: ep5in: re=
q 00000000cb1d250d length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300559: dwc3_prepare_trb: ep5in:=
 trb 00000000d3571109 (E145:D112) buf 0000ffffffb28ae8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300561: dwc3_prepare_trb: ep5in:=
 trb 000000007e3b29d0 (E146:D112) buf 0000ffffffb29b74 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300563: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300564: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300565: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300566: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300573: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 0003545c
    kworker/u5:0-103     [001] d..2.   303.300575: dwc3_ep_queue: ep5in: re=
q 0000000039270917 length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300581: dwc3_prepare_trb: ep5in:=
 trb 00000000abc803fb (E147:D112) buf 0000ffffffb2cea8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300583: dwc3_prepare_trb: ep5in:=
 trb 00000000f4e4afdb (E148:D112) buf 0000ffffffb2d76c size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300585: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300586: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300587: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300588: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300594: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 0003545c
    kworker/u5:0-103     [001] d..2.   303.300596: dwc3_ep_queue: ep5in: re=
q 00000000803068b1 length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300602: dwc3_prepare_trb: ep5in:=
 trb 0000000062759476 (E149:D112) buf 0000ffffffb306e8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300604: dwc3_prepare_trb: ep5in:=
 trb 0000000076d1e318 (E150:D112) buf 0000ffffffb31364 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300606: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300607: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300608: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300609: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300616: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 0003545c
    kworker/u5:0-103     [001] d..2.   303.300618: dwc3_ep_queue: ep5in: re=
q 000000009b7e08f9 length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300624: dwc3_prepare_trb: ep5in:=
 trb 000000007eb5d983 (E151:D112) buf 0000ffffffb34e28 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300626: dwc3_prepare_trb: ep5in:=
 trb 00000000dfcddf34 (E152:D112) buf 0000ffffffb35f5c size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300627: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300628: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300629: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300630: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300637: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 0003545c
    kworker/u5:0-103     [001] d..2.   303.300640: dwc3_ep_queue: ep5in: re=
q 000000001a38dcac length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300645: dwc3_prepare_trb: ep5in:=
 trb 00000000a4de6c46 (E153:D112) buf 0000ffffffb403a8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300647: dwc3_prepare_trb: ep5in:=
 trb 00000000a232b4ca (E154:D112) buf 0000ffffffb41b54 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300649: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300650: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300651: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300652: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300659: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 0003545c
    kworker/u5:0-103     [001] d..2.   303.300661: dwc3_ep_queue: ep5in: re=
q 00000000be265ac6 length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300667: dwc3_prepare_trb: ep5in:=
 trb 00000000a2be3f51 (E155:D112) buf 0000ffffffb3cd68 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300669: dwc3_prepare_trb: ep5in:=
 trb 00000000f8c7bb97 (E156:D112) buf 0000ffffffb3d74c size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300671: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300672: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300673: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300674: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300680: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035464
    kworker/u5:0-103     [001] d..2.   303.300682: dwc3_ep_queue: ep5in: re=
q 000000008c3acb19 length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300688: dwc3_prepare_trb: ep5in:=
 trb 000000000058d163 (E157:D112) buf 0000ffffffb384a8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300690: dwc3_prepare_trb: ep5in:=
 trb 00000000d28a0b36 (E158:D112) buf 0000ffffffb39344 size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300692: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300693: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300694: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300695: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300702: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035464
    kworker/u5:0-103     [001] d..2.   303.300704: dwc3_ep_queue: ep5in: re=
q 000000003b45383a length 0/7168 zsi =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300710: dwc3_prepare_trb: ep5in:=
 trb 000000000da4d0e7 (E159:D112) buf 0000ffffffaf0ce8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300712: dwc3_prepare_trb: ep5in:=
 trb 00000000a397b469 (E160:D112) buf 0000ffffffaf1f3c size 1x 7160 ctrl 00=
000471:00000000 (Hlcs:Sc:isoc)
    kworker/u5:0-103     [001] d..2.   303.300714: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300715: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300716: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300717: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
    kworker/u5:0-103     [001] d..1.   303.300724: dwc3_readl: addr 0000000=
068f703d8 offset c70c value 00035464
    kworker/u5:0-103     [001] d..2.   303.300726: dwc3_ep_queue: ep5in: re=
q 000000005af62967 length 0/1180 zsI =3D=3D> -115
    kworker/u5:0-103     [001] d..2.   303.300731: dwc3_prepare_trb: ep5in:=
 trb 000000000f40be5d (E161:D112) buf 0000ffffff8aefa8 size 1x 8 ctrl 00000=
465:00000000 (HlCs:Sc:isoc-first)
    kworker/u5:0-103     [001] d..2.   303.300733: dwc3_prepare_trb: ep5in:=
 trb 00000000d536f1d5 (E162:D112) buf 0000ffffff8afb34 size 1x 1172 ctrl 00=
000c71:00000000 (Hlcs:SC:isoc)
    kworker/u5:0-103     [001] d..2.   303.300735: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
    kworker/u5:0-103     [001] d..2.   303.300736: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0407
    kworker/u5:0-103     [001] d..2.   303.300737: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0007
    kworker/u5:0-103     [001] d..2.   303.300738: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'Update Transfer' [b0407] params 00000000 00000000 00000000 --> stat=
us: Successful
     irq/50-dwc3-317     [000] d..1.   303.307600: dwc3_complete_trb: ep5in=
: trb 0000000030bedaf0 (E162:D113) buf 0000ffffffb18d28 size 1x 0 ctrl 3aa2=
4464:0000ea89 (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.307602: dwc3_complete_trb: ep5in=
: trb 000000009cea9eeb (E162:D114) buf 0000ffffffb19bf4 size 1x 7168 ctrl 3=
aa24470:0000ea89 (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.307608: dwc3_gadget_giveback: ep=
5in: req 0000000051b03a63 length 0/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.314827: dwc3_complete_trb: ep5in=
: trb 0000000067df777d (E162:D115) buf 0000ffffffa6c968 size 1x 0 ctrl 3aa2=
8464:0000ea8a (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.314829: dwc3_complete_trb: ep5in=
: trb 0000000027dc06f7 (E162:D116) buf 0000ffffffa6d7ec size 1x 0 ctrl 3aa2=
8470:0000ea8a (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.314835: dwc3_gadget_giveback: ep=
5in: req 00000000b5e8c200 length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.322057: dwc3_complete_trb: ep5in=
: trb 00000000e92e3cbd (E162:D117) buf 0000ffffffb58568 size 1x 0 ctrl 3aa2=
c464:0000ea8b (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.322059: dwc3_complete_trb: ep5in=
: trb 0000000008efb276 (E162:D118) buf 0000ffffffb593e4 size 1x 0 ctrl 3aa2=
c470:0000ea8b (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.322065: dwc3_gadget_giveback: ep=
5in: req 000000008ba09979 length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.329287: dwc3_complete_trb: ep5in=
: trb 00000000634dffa2 (E162:D119) buf 0000ffffffb745a8 size 1x 0 ctrl 3aa3=
0464:0000ea8c (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.329290: dwc3_complete_trb: ep5in=
: trb 00000000544b5d11 (E162:D120) buf 0000ffffffb75fdc size 1x 0 ctrl 3aa3=
0470:0000ea8c (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.329295: dwc3_gadget_giveback: ep=
5in: req 00000000fc26cabb length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.336518: dwc3_complete_trb: ep5in=
: trb 0000000055a06d19 (E162:D121) buf 0000ffffffb782e8 size 1x 0 ctrl 3aa3=
4464:0000ea8d (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.336520: dwc3_complete_trb: ep5in=
: trb 00000000221e87a1 (E162:D122) buf 0000ffffffb79bd4 size 1x 0 ctrl 3aa3=
4470:0000ea8d (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.336526: dwc3_gadget_giveback: ep=
5in: req 000000004e112f8f length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.343748: dwc3_complete_trb: ep5in=
: trb 00000000b0827538 (E162:D123) buf 0000ffffffb7ca68 size 1x 0 ctrl 3aa3=
8464:0000ea8e (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.343751: dwc3_complete_trb: ep5in=
: trb 0000000007c04114 (E162:D124) buf 0000ffffffb7d7cc size 1x 0 ctrl 3aa3=
8470:0000ea8e (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.343756: dwc3_gadget_giveback: ep=
5in: req 00000000a77632f8 length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.350979: dwc3_complete_trb: ep5in=
: trb 000000005394448b (E162:D125) buf 0000ffffffb80ba8 size 1x 0 ctrl 3aa3=
c464:0000ea8f (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.350981: dwc3_complete_trb: ep5in=
: trb 000000004361b6ec (E162:D126) buf 0000ffffffb813c4 size 1x 0 ctrl 3aa3=
c470:0000ea8f (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.350986: dwc3_gadget_giveback: ep=
5in: req 000000009d99afac length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.358209: dwc3_complete_trb: ep5in=
: trb 000000000fc782b8 (E162:D127) buf 0000ffffffb84828 size 1x 0 ctrl 3aa4=
0464:0000ea90 (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.358212: dwc3_complete_trb: ep5in=
: trb 00000000f594423f (E162:D128) buf 0000ffffffb85fbc size 1x 0 ctrl 3aa4=
0470:0000ea90 (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.358217: dwc3_gadget_giveback: ep=
5in: req 00000000b27ec36b length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.365440: dwc3_complete_trb: ep5in=
: trb 00000000391b49ab (E162:D129) buf 0000ffffffb889a8 size 1x 0 ctrl 3aa4=
4464:0000ea91 (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.365442: dwc3_complete_trb: ep5in=
: trb 00000000979d3c23 (E162:D130) buf 0000ffffffb89bb4 size 1x 0 ctrl 3aa4=
4470:0000ea91 (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.365448: dwc3_gadget_giveback: ep=
5in: req 000000007b6ed6f3 length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.372670: dwc3_complete_trb: ep5in=
: trb 000000007ab7715a (E162:D131) buf 0000ffffffb8c0a8 size 1x 0 ctrl 3aa4=
8464:0000ea92 (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.372672: dwc3_complete_trb: ep5in=
: trb 00000000217c7be7 (E162:D132) buf 0000ffffffb8d7ac size 1x 0 ctrl 3aa4=
8470:0000ea92 (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.372678: dwc3_gadget_giveback: ep=
5in: req 00000000bc2b6c4d length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.379900: dwc3_complete_trb: ep5in=
: trb 00000000907e85e1 (E162:D133) buf 0000ffffffb90928 size 1x 0 ctrl 3aa4=
c464:0000ea93 (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.379904: dwc3_complete_trb: ep5in=
: trb 00000000bb860433 (E162:D134) buf 0000ffffffb913a4 size 1x 0 ctrl 3aa4=
c470:0000ea93 (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.379909: dwc3_gadget_giveback: ep=
5in: req 00000000f8f3eb0d length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.387131: dwc3_complete_trb: ep5in=
: trb 00000000c0003d17 (E162:D135) buf 0000ffffffb94528 size 1x 0 ctrl 3aa5=
0464:0000ea94 (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.387133: dwc3_complete_trb: ep5in=
: trb 00000000b03c9834 (E162:D136) buf 0000ffffffb95f9c size 1x 0 ctrl 3aa5=
0470:0000ea94 (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.387139: dwc3_gadget_giveback: ep=
5in: req 00000000ab8d9880 length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.394361: dwc3_complete_trb: ep5in=
: trb 00000000c55d236b (E162:D137) buf 0000ffffffb98ca8 size 1x 0 ctrl 3aa5=
4464:0000ea95 (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.394363: dwc3_complete_trb: ep5in=
: trb 0000000079a7319b (E162:D138) buf 0000ffffffb99b94 size 1x 0 ctrl 3aa5=
4470:0000ea95 (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.394369: dwc3_gadget_giveback: ep=
5in: req 00000000d4dc2a9c length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.401592: dwc3_complete_trb: ep5in=
: trb 0000000066932860 (E162:D139) buf 0000ffffffae88a8 size 1x 0 ctrl 3aa5=
8464:0000ea96 (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.401594: dwc3_complete_trb: ep5in=
: trb 0000000062d70129 (E162:D140) buf 0000ffffffae978c size 1x 0 ctrl 3aa5=
8470:0000ea96 (hlcs:Sc:isoc)
     irq/50-dwc3-317     [000] d..1.   303.401600: dwc3_gadget_giveback: ep=
5in: req 000000002268e4db length 7168/7168 zsi =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.408822: dwc3_complete_trb: ep5in=
: trb 00000000c7f30d08 (E162:D141) buf 0000ffffffb20da8 size 1x 0 ctrl 3aa5=
c464:0000ea97 (hlCs:Sc:isoc-first)
     irq/50-dwc3-317     [000] d..1.   303.408825: dwc3_complete_trb: ep5in=
: trb 000000009ee7250a (E162:D142) buf 0000ffffffb21384 size 1x 0 ctrl 3aa5=
cc70:0000ea97 (hlcs:SC:isoc)
     irq/50-dwc3-317     [000] d..1.   303.408830: dwc3_gadget_giveback: ep=
5in: req 00000000e5c4f08a length 7168/7168 zsI =3D=3D> -18
     irq/50-dwc3-317     [000] d..1.   303.416054: dwc3_event: event (ea898=
096): ep5in: Transfer In Progress [0000ea89] (siM)
     irq/50-dwc3-317     [000] d..1.   303.416056: dwc3_readl: addr 0000000=
043b43362 offset c2c0 value 010c8002
     irq/50-dwc3-317     [000] d..1.   303.416057: dwc3_writel: addr 000000=
00980f66dc offset 0008 value 00000000
     irq/50-dwc3-317     [000] d..1.   303.416058: dwc3_writel: addr 000000=
00e5d226be offset 0004 value 00000000
     irq/50-dwc3-317     [000] d..1.   303.416059: dwc3_writel: addr 000000=
00cd12f6fc offset 0000 value 00000000
     irq/50-dwc3-317     [000] d..1.   303.416060: dwc3_writel: addr 000000=
005a3de08f offset 000c value 000b0d08
     irq/50-dwc3-317     [000] d..1.   303.416061: dwc3_readl: addr 0000000=
05a3de08f offset 000c value 000b0908
     irq/50-dwc3-317     [000] d..1.   303.416062: dwc3_gadget_ep_cmd: ep5i=
n: cmd 'End Transfer' [b0d08] params 00000000 00000000 00000000 --> status:=
 Successful
     irq/50-dwc3-317     [000] d..1.   303.416063: dwc3_writel: addr 000000=
0077945c0a offset c408 value 00001000
     irq/50-dwc3-317     [000] d.h1.   303.416159: dwc3_readl: addr 0000000=
073cc91b4 offset c40c value 00000010
     irq/50-dwc3-317     [000] d.h1.   303.416161: dwc3_writel: addr 000000=
0077945c0a offset c408 value 80001000
     irq/50-dwc3-317     [000] d.h1.   303.416162: dwc3_writel: addr 000000=
0073cc91b4 offset c40c value 00000010
     irq/50-dwc3-317     [000] d..1.   303.416232: dwc3_event: event (ea974=
096): ep5in: Transfer In Progress [0000ea97] (sIm)
     irq/50-dwc3-317     [000] d..1.   303.416234: dwc3_event: event (eaa14=
096): ep5in: Transfer In Progress [0000eaa1] (sIm)
     irq/50-dwc3-317     [000] d..1.   303.416235: dwc3_event: event (080b0=
1d6): ep5in: Endpoint Command Complete
     irq/50-dwc3-317     [000] d..1.   303.416244: dwc3_gadget_giveback: ep=
5in: req 00000000d325210d length 0/7168 zsi =3D=3D> -104
     irq/50-dwc3-317     [000] d..1.   303.423562: dwc3_gadget_giveback: ep=
5in: req 00000000cb1d250d length 0/7168 zsi =3D=3D> -104
     irq/50-dwc3-317     [000] d..1.   303.430874: dwc3_gadget_giveback: ep=
5in: req 0000000039270917 length 0/7168 zsi =3D=3D> -104
     irq/50-dwc3-317     [000] d..1.   303.438182: dwc3_gadget_giveback: ep=
5in: req 00000000803068b1 length 0/7168 zsi =3D=3D> -104
     irq/50-dwc3-317     [000] d..1.   303.445490: dwc3_gadget_giveback: ep=
5in: req 000000009b7e08f9 length 0/7168 zsi =3D=3D> -104
     irq/50-dwc3-317     [000] d..1.   303.452799: dwc3_gadget_giveback: ep=
5in: req 000000001a38dcac length 0/7168 zsi =3D=3D> -104
     irq/50-dwc3-317     [000] d..1.   303.460107: dwc3_gadget_giveback: ep=
5in: req 00000000be265ac6 length 0/7168 zsi =3D=3D> -104
     irq/50-dwc3-317     [000] d..1.   303.467415: dwc3_gadget_giveback: ep=
5in: req 000000008c3acb19 length 0/7168 zsi =3D=3D> -104
     irq/50-dwc3-317     [000] d..1.   303.474724: dwc3_gadget_giveback: ep=
5in: req 000000003b45383a length 0/7168 zsi =3D=3D> -104
     irq/50-dwc3-317     [000] d..1.   303.482033: dwc3_gadget_giveback: ep=
5in: req 000000005af62967 length 0/1180 zsI =3D=3D> -104
     irq/50-dwc3-317     [000] d..1.   303.489347: dwc3_event: event (ee271=
0d6): ep5in: Transfer Not Ready [0000ee27] (Not Active)
     ...


>Please check if the host is actually polling for data at that uframe.
>Each TRB is scheduled for a particular interval. If the host doesn't
>request for data at that particular interval, then it's a missed isoc
>also (err -18). So, if you have a usb traffic analyzer, please verify
>this. Also, maybe try with a different host vendor to see if the
>behavior is the same.

The behavior seems to differ if I attach different hosts. I have no
traffic analyzer. Would usbmon under linux host work for that? How would
I synchronize the gadget request and host urbs to know which frame
interval would have been the one that was missed in my logs?

Is there any way the gadget driver could see if for that interval the
host did not poll for data? OR are there bits to get this behaviour
predictable and the driver to react on?

Otherwise, why should on an ongoing stream the host not poll
for data in any interval. What would be the constraints to
ignore one interval.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--QxN5xOWGsmh5a4wb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmIgo0oACgkQC+njFXoe
LGTn5w/6AgaVBp+/EszC8A+D8lIiQ5Xj9AAZnGsiQiEs03yw5S0bBJQi93zVFiT+
xKO8CWlQHaLLuBxzzUaiAkBi4MQ9h2YccZz9cOLnVuWB7FN9jvocbQkXa6UIBO9N
81Wd9ovvJ7boLcQR9Ox5Sdl6Ohi89yRXmf/5sAj0vrwle8KNGbbf4C/ytsSk5AxW
BwSnkrfnm163rg5rXYms6H2SGE2hwDjSvbu5WVZ5CLc8u/gztF6a8JpqznbupLV6
qoE/WbfGeuNWSW0Kw4Y+9Enj4v3NToddgZ2uQCE4ejGiDy6OVucfBc0O02nHDoWC
pbUXnI3tXtBLcymPCEOO/2I7yoE+TYM+Ft+oy71e9aO69U6ml+fmtpHo6Ly7yH24
sw6ke1sHUcgUTLxRzABs10gLmj4xeGX0qYcQAQwh9g0ucQrT9qQEZizUVekxd0Ag
eKoHYToqmaQl+j1w8rYweq7YOPsj2OgyDLuewvAyAeM8SfK9QCKfKnrYCV+8Q6tT
HTnSMOy0WztdNnJ35HmUsEeDmLVLynoCwATYMjQQnTKMKTFpK6U0UBCXE1N14516
hN/N/N3YwBwXL/gNvW2wru92kfXhMVypBaj8wtwf15OtENWqYEwCrmM8fzlRyLGx
6aAMbe56u0iu7Aus4mu2pweYEZhYDe8H9715a9gWAIZu5bVnLj4=
=ZIJM
-----END PGP SIGNATURE-----

--QxN5xOWGsmh5a4wb--
