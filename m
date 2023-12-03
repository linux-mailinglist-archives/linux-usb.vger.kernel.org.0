Return-Path: <linux-usb+bounces-3606-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 773AB802167
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 07:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF0AE1F2108F
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 06:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B8C23AE;
	Sun,  3 Dec 2023 06:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TkLisoVk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sm49OBg3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D15B173B
	for <linux-usb@vger.kernel.org>; Sat,  2 Dec 2023 22:52:41 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D8FD71FDFB;
	Sun,  3 Dec 2023 06:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1701586359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HTGgUaT5+cjqtPsT4V5qjGBAUtAiKJnalm/wuoI/CYU=;
	b=TkLisoVk1AOVJCY/uVjwgBcGfGbjBAohRioDMh5VWUdEq0P3jk2NOfo+GtL9z9VlLoz/im
	nIV0Zepd/htK7wlvyNpqwQxa0MY8H5+tmlB3tUjjFJCRuAFbUjMINyF/eDfndSnUaNBrLg
	opdY/4Pi6IOvOEEbd/inZD9Yi3oqnYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701586359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HTGgUaT5+cjqtPsT4V5qjGBAUtAiKJnalm/wuoI/CYU=;
	b=Sm49OBg3q9I6AuV9Tr6T1n/K511M071PxzLapwEeXyyEYYt7e/evF1myr7KnWMD8yEeV7j
	3ocQjO265GzNV/DA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id BBCD51344E;
	Sun,  3 Dec 2023 06:52:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id WnEOLLclbGWtBwAAn2gu4w
	(envelope-from <aporta@suse.de>); Sun, 03 Dec 2023 06:52:39 +0000
Date: Sun, 3 Dec 2023 07:52:39 +0100
From: Andrea della Porta <aporta@suse.de>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: Ivan Ivanov <ivan.ivanov@suse.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Message-ID: <ZWwltzMB8gq5k5oe@apocalypse>
Mail-Followup-To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
	Ivan Ivanov <ivan.ivanov@suse.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>
References: <20231115144514.15248-1-oneukum@suse.com>
 <f0bd323a-8384-e303-907f-5d533af6d71e@synopsys.com>
 <ZWRbkdTASTNJB8Fv@apocalypse>
 <f293d306-54fb-ecb5-4515-70a6c1faf1b1@synopsys.com>
 <ZWWsGknhNuVggNNa@apocalypse>
 <bfb8e693-7085-430c-0481-3d6630168240@synopsys.com>
 <d8176b8a6851974a692804f006d59d3324903b62.camel@suse.com>
 <079ddad4-ab41-49ac-6d86-d90075320dcd@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <079ddad4-ab41-49ac-6d86-d90075320dcd@synopsys.com>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.994];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -3.80

Hi Minas,

On 10:26 Fri 01 Dec     , Minas Harutyunyan wrote:
> Hi Ivan,
> 
> On 11/28/23 18:43, Ivan Ivanov wrote:
> > 
> > Hi Minas,
> > 
> > On Tue, 2023-11-28 at 11:48 +0000, Minas Harutyunyan wrote:
> >>
> >> Does this "spurious" interrupt broke your tests?
> > 
> > It is not just some kind of synthetic test case that was broken.
> > but real world usage. You can find complains about this error on
> > various internet forums, just search for dwc2_hc_chhltd_intr_dma
> > and it is not so difficult to reproduce.
> > 
> > Without databook I am not sure we can create better fix, but if
> > you develop different solution I will gladly tested it.
> > 
> > Regards,
> > Ivan
> 1. In addition to HCCHARx and ep_type printing please add printing of 
> GRXFSTSR if EP is IN or GNPTXSTS if EP is OUT, and provide dmesg with 
> error case.

Here's the log, before comenting the 'goto' out:


[684829.206854] --Host Channel Interrupt--, Channel 2
[684829.206866]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[684829.206875]   hcchar[2] = 0x015c9810, chan->ep_type=3
[684829.206883]   GRXSTSR = 0x000E0002
[684829.214851] --Host Channel Interrupt--, Channel 6
[684829.214864]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[684829.214876]   hcchar[6] = 0x015c9810, chan->ep_type=3
[684829.214886]   GRXSTSR = 0x000E0007
[684829.217853] --Host Channel Interrupt--, Channel 5
[684829.217869]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[684829.217881]   hcchar[5] = 0x009c8801, chan->ep_type=3
[684829.217891]   GRXSTSR = 0x000E0005
[684829.222647] --Host Channel Interrupt--, Channel 0
[684829.222659]   hcint 0x00000021, hcintmsk 0x00000426, hcint&hcintmsk 0x00000020
[684829.222671]   hcchar[0] = 0x01d8d200, chan->ep_type=2
[684829.222681]   GRXSTSR = 0x00070044
[684829.222696] --Host Channel Interrupt--, Channel 0
[684829.222704]   hcint 0x00000002, hcintmsk 0x00000406, hcint&hcintmsk 0x00000002
[684829.222714]   hcchar[0] = 0x01d8d200, chan->ep_type=2
[684829.222724]   GRXSTSR = 0x00070044
[684829.222740] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: Channel 0 - ChHltd set, but reason is unknown
[684829.222758] dwc2 3f980000.usb: hcint 0x00000002, intsts 0x04000009
[684829.222797] --Host Channel Interrupt--, Channel 7
[684829.222806]   hcint 0x00000010, hcintmsk 0x00000436, hcint&hcintmsk 0x00000010
[684829.222816]   hcchar[7] = 0x81d8d200, chan->ep_type=2
[684829.222827]   GRXSTSR = 0x00070044
[684829.222851] --Host Channel Interrupt--, Channel 4
[684829.222859]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[684829.222869]   hcchar[4] = 0x015c9810, chan->ep_type=3
[684829.222879]   GRXSTSR = 0x000F0004
[684829.230853] --Host Channel Interrupt--, Channel 3
[684829.230875]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[684829.230885]   hcchar[3] = 0x015c9810, chan->ep_type=3
[684829.230895]   GRXSTSR = 0x00050000
[684829.238852] --Host Channel Interrupt--, Channel 2
[684829.238870]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[684829.238881]   hcchar[2] = 0x015c9810, chan->ep_type=3
[684829.238890]   GRXSTSR = 0x00070000
[684829.246851] --Host Channel Interrupt--, Channel 6
[684829.246863]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[684829.246872]   hcchar[6] = 0x015c9810, chan->ep_type=3
[684829.246880]   GRXSTSR = 0x000F0000


> 2. In function dwc2_hc_chhltd_intr_dma() remove "goto error;" after 
> printing "ChHltd set, but reason is unknown".a

Interestingly enough, with goto commented we do not see any error written on dmesg
(neither 'ChHltd set, but reason is unknown' nor 'Transaction Error---'), but
the ping is not working anymore (i.e. ping -I wwan0 8.8.8.8 from cmdline) is
not acknowledging any reply. Other peripherals attached to USB as the ethernet
are still working as usual.

> 
> Questions.
> 1. Do you see in the dmesg "Transaction Error--" before "ChHltd set, but 
> reason is unknown"?

No

> 2. Your driver built for Host mode only or for both Device/Host?

The module has been compiled as dual role driver.

> 3. If you build driver with debug and verbose debug prints enabled, 
> issue still seen?

Yes, please see the log below for further detail:


[50732.286732] --Host Channel Interrupt--, Channel 7
[50732.286742]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.286752]   hcchar[7] = 0x015c9810, chan->ep_type=3
[50732.286761]   GRXSTSR = 0x000E0003
[50732.294732] --Host Channel Interrupt--, Channel 3
[50732.294742]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.294752]   hcchar[3] = 0x015c9810, chan->ep_type=3
[50732.294762]   GRXSTSR = 0x000E0004
[50732.302732] --Host Channel Interrupt--, Channel 2
[50732.302745]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.302755]   hcchar[2] = 0x015c9810, chan->ep_type=3
[50732.302763]   GRXSTSR = 0x000E0000
[50732.310732] --Host Channel Interrupt--, Channel 5
[50732.310741]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.310751]   hcchar[5] = 0x015c9810, chan->ep_type=3
[50732.310760]   GRXSTSR = 0x000E0006
[50732.318732] --Host Channel Interrupt--, Channel 6
[50732.318746]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.318756]   hcchar[6] = 0x015c9810, chan->ep_type=3
[50732.318765]   GRXSTSR = 0x000E0002
[50732.325262] --Host Channel Interrupt--, Channel 1
[50732.325276]   hcint 0x00000003, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.325286]   hcchar[1] = 0x01d83200, chan->ep_type=2
[50732.325295]   GNPTXSTS = 0x00000100
[50732.325309] dwc2 3f980000.usb: --Host Channel 1 Interrupt: Channel Halted--
[50732.325324] dwc2 3f980000.usb: --Host Channel 1 Interrupt: DMA Channel Halted--
[50732.325337] dwc2 3f980000.usb: --Host Channel 1 Interrupt: Transfer Complete--
[50732.325350] dwc2 3f980000.usb:   Bulk transfer complete
[50732.325362] dwc2 3f980000.usb: urb->actual_length=0 xfer_length=98
[50732.325375] dwc2 3f980000.usb: DWC_otg: dwc2_update_urb_state: OUT, channel 1
[50732.325389] dwc2 3f980000.usb:   chan->xfer_len 98
[50732.325400] dwc2 3f980000.usb:   hctsiz.xfersize 98
[50732.325411] dwc2 3f980000.usb:   urb->transfer_buffer_length 98
[50732.325423] dwc2 3f980000.usb:   urb->actual_length 98
[50732.325433] dwc2 3f980000.usb:   short_read 0, xfer_done 1
[50732.325452] dwc2 3f980000.usb: dwc2_complete_non_periodic_xfer()
[50732.325465] dwc2 3f980000.usb:   dwc2_release_channel: channel 1, halt_status 2
[50732.325478] dwc2 3f980000.usb:   dwc2_deactivate_qh(0000000071c758b5,00000000c2c3a3ef,1)
[50732.326735] --Host Channel Interrupt--, Channel 7
[50732.326757]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.326769]   hcchar[7] = 0x015c9810, chan->ep_type=3
[50732.326779]   GRXSTSR = 0x000E0007
[50732.334735] --Host Channel Interrupt--, Channel 3
[50732.334756]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.334768]   hcchar[3] = 0x015c9810, chan->ep_type=3
[50732.334778]   GRXSTSR = 0x000E0003
[50732.342736] --Host Channel Interrupt--, Channel 2
[50732.342759]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.342771]   hcchar[2] = 0x015c9810, chan->ep_type=3
[50732.342782]   GRXSTSR = 0x000E0004
[50732.350732] --Host Channel Interrupt--, Channel 5
[50732.350745]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.350751]   hcchar[5] = 0x015c9810, chan->ep_type=3
[50732.350757]   GRXSTSR = 0x000E0000
[50732.357386] --Host Channel Interrupt--, Channel 0
[50732.357396]   hcint 0x00000021, hcintmsk 0x00000426, hcint&hcintmsk 0x00000020
[50732.357402]   hcchar[0] = 0x01d8d200, chan->ep_type=2
[50732.357407]   GRXSTSR = 0x000E0003
[50732.357417] dwc2 3f980000.usb: --Host Channel 0 Interrupt: ACK Received--
[50732.357429] --Host Channel Interrupt--, Channel 0
[50732.357433]   hcint 0x00000002, hcintmsk 0x00000406, hcint&hcintmsk 0x00000002
[50732.357439]   hcchar[0] = 0x01d8d200, chan->ep_type=2
[50732.357444]   GRXSTSR = 0x000E0003
[50732.357450] dwc2 3f980000.usb: --Host Channel 0 Interrupt: Channel Halted--
[50732.357457] dwc2 3f980000.usb: --Host Channel 0 Interrupt: DMA Channel Halted--
[50732.357465] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: Channel 0 - ChHltd set, but reason is unknown
[50732.357473] dwc2 3f980000.usb: hcint 0x00000002, intsts 0x04600001
[50732.357482] dwc2 3f980000.usb: dwc2_update_urb_state_abn(): trimming xfer length
[50732.357490] dwc2 3f980000.usb: DWC_otg: dwc2_update_urb_state_abn: IN, channel 0
[50732.357498] dwc2 3f980000.usb:   chan->start_pkt_count 1
[50732.357505] dwc2 3f980000.usb:   hctsiz.pktcnt 0
[50732.357512] dwc2 3f980000.usb:   chan->max_packet 512
[50732.357519] dwc2 3f980000.usb:   bytes_transferred 490
[50732.357525] dwc2 3f980000.usb:   urb->actual_length 1514
[50732.357532] dwc2 3f980000.usb:   urb->transfer_buffer_length 1514
[50732.357539] dwc2 3f980000.usb: dwc2_halt_channel()
[50732.357546] dwc2 3f980000.usb: DMA enabled
[50732.357552] dwc2 3f980000.usb:   dwc2_release_channel: channel 0, halt_status 7
[50732.357561] dwc2 3f980000.usb:   Complete URB with transaction error
[50732.357572] dwc2 3f980000.usb:   dwc2_deactivate_qh(0000000071c758b5,000000009ab78884,1)
[50732.358737] --Host Channel Interrupt--, Channel 1
[50732.358753]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.358759]   hcchar[1] = 0x015c9810, chan->ep_type=3
[50732.358765]   GRXSTSR = 0x000E0004
[50732.366732] --Host Channel Interrupt--, Channel 7
[50732.366746]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.366752]   hcchar[7] = 0x015c9810, chan->ep_type=3
[50732.366758]   GRXSTSR = 0x000E0000
[50732.371732] --Host Channel Interrupt--, Channel 3
[50732.371746]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.371753]   hcchar[3] = 0x00dc8801, chan->ep_type=3
[50732.371758]   GRXSTSR = 0x000E0006
[50732.374731] --Host Channel Interrupt--, Channel 2
[50732.374740]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.374746]   hcchar[2] = 0x015c9810, chan->ep_type=3
[50732.374752]   GRXSTSR = 0x00050047
[50732.382732] --Host Channel Interrupt--, Channel 5
[50732.382742]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.382748]   hcchar[5] = 0x015c9810, chan->ep_type=3
[50732.382754]   GRXSTSR = 0x00000840
[50732.390730] --Host Channel Interrupt--, Channel 0
[50732.390737]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.390742]   hcchar[0] = 0x015c9810, chan->ep_type=3
[50732.390748]   GRXSTSR = 0x00070047
[50732.398732] --Host Channel Interrupt--, Channel 1
[50732.398744]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[50732.398753]   hcchar[1] = 0x015c9810, chan->ep_type=3
[50732.398761]   GRXSTSR = 0x000F0007

> 4. Andrea wrote: "we are atrss testing via ping flooding
> through an LTE modem attached". This about USB2.0 ping flood in USB 
> trace or just "ping" user command?
>

I'm not sure to understand what you mean by 'USB2.0 ping flood in USB 
trace' but we are using ping command from shell via ssh, as the following:
ping -f -I wwan0 8.8.8.8
Please note that the ping flooding is not needed to reproduce the issue, just 
a one-per-second ping is sufficient. The flooding version makes the issue
happening more frequently so it's faster to gather the relevant logs, so the
higly sustained USB traffic is not necessarily the culprit.
Also note that this is not related to the specific modem driver iwe're using
since the same issue has been noted with other peripherals.
 
> Thanks,
> Minas

Many thanks,
Andrea

