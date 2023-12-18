Return-Path: <linux-usb+bounces-4315-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1378173B7
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 15:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0D62B23775
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 14:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BEA1D144;
	Mon, 18 Dec 2023 14:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RpOP8NKb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2ERhtadi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RpOP8NKb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2ERhtadi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C381D148
	for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 752101F396;
	Mon, 18 Dec 2023 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702910185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=orBPCRN8tvOMWdl09gf1WkaT7M89Xr4uWWB1P1n9Uy0=;
	b=RpOP8NKbxfWZT85gpOjKUEvWPRuW3Tootr8JprVl2Kgt/jlF5Qm09CsPrxKO8bm9YrpbDm
	/uKsz03808v/m3D92HFUZ3K0y0VoDFHpNX3tUpFgyqAfTUSybFt7Tb9ePIJZOUmRuAkWpp
	g6gQBxZT0oS+zlS3jBefgzSosK1GkWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702910185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=orBPCRN8tvOMWdl09gf1WkaT7M89Xr4uWWB1P1n9Uy0=;
	b=2ERhtadi6K4S97STsoEzCxsLlq8jVtzzYJqMa7eV4xBaI+ov8MN3vIbBH5dBfGA+rbnkzW
	sgJhL2wEOJEwQFCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702910185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=orBPCRN8tvOMWdl09gf1WkaT7M89Xr4uWWB1P1n9Uy0=;
	b=RpOP8NKbxfWZT85gpOjKUEvWPRuW3Tootr8JprVl2Kgt/jlF5Qm09CsPrxKO8bm9YrpbDm
	/uKsz03808v/m3D92HFUZ3K0y0VoDFHpNX3tUpFgyqAfTUSybFt7Tb9ePIJZOUmRuAkWpp
	g6gQBxZT0oS+zlS3jBefgzSosK1GkWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702910185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=orBPCRN8tvOMWdl09gf1WkaT7M89Xr4uWWB1P1n9Uy0=;
	b=2ERhtadi6K4S97STsoEzCxsLlq8jVtzzYJqMa7eV4xBaI+ov8MN3vIbBH5dBfGA+rbnkzW
	sgJhL2wEOJEwQFCg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5101B13927;
	Mon, 18 Dec 2023 14:36:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 6e6LEelYgGVQbwAAn2gu4w
	(envelope-from <aporta@suse.de>); Mon, 18 Dec 2023 14:36:25 +0000
Date: Mon, 18 Dec 2023 15:36:24 +0100
From: Andrea della Porta <aporta@suse.de>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: Ivan Ivanov <ivan.ivanov@suse.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Message-ID: <ZYBY6LdDLRc0XBx_@apocalypse>
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
 <ZWwltzMB8gq5k5oe@apocalypse>
 <07250e1e-c5ca-0586-b53f-7f2bb3d19b39@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07250e1e-c5ca-0586-b53f-7f2bb3d19b39@synopsys.com>
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.80
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
	 NEURAL_HAM_SHORT(-0.20)[-0.997];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Hi Minas,

On 12:23 Thu 14 Dec     , Minas Harutyunyan wrote:
> Hi Andrea,
> 
> On 12/3/23 10:52, Andrea della Porta wrote:
> > Hi Minas,
> > 
> > On 10:26 Fri 01 Dec     , Minas Harutyunyan wrote:
> >> Hi Ivan,
> >>
> >> On 11/28/23 18:43, Ivan Ivanov wrote:
> >>>
> >>> Hi Minas,
> >>>
> >>> On Tue, 2023-11-28 at 11:48 +0000, Minas Harutyunyan wrote:
> >>>>
> >>>> Does this "spurious" interrupt broke your tests?
> >>>
> >>> It is not just some kind of synthetic test case that was broken.
> >>> but real world usage. You can find complains about this error on
> >>> various internet forums, just search for dwc2_hc_chhltd_intr_dma
> >>> and it is not so difficult to reproduce.
> >>>
> >>> Without databook I am not sure we can create better fix, but if
> >>> you develop different solution I will gladly tested it.
> >>>
> >>> Regards,
> >>> Ivan
> >> 1. In addition to HCCHARx and ep_type printing please add printing of
> >> GRXFSTSR if EP is IN or GNPTXSTS if EP is OUT, and provide dmesg with
> >> error case.
> > 
> > Here's the log, before comenting the 'goto' out:
> > 
> > 
> > [684829.206854] --Host Channel Interrupt--, Channel 2
> > [684829.206866]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
> > [684829.206875]   hcchar[2] = 0x015c9810, chan->ep_type=3
> > [684829.206883]   GRXSTSR = 0x000E0002
> > [684829.214851] --Host Channel Interrupt--, Channel 6
> > [684829.214864]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
> > [684829.214876]   hcchar[6] = 0x015c9810, chan->ep_type=3
> > [684829.214886]   GRXSTSR = 0x000E0007
> > [684829.217853] --Host Channel Interrupt--, Channel 5
> > [684829.217869]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
> > [684829.217881]   hcchar[5] = 0x009c8801, chan->ep_type=3
> > [684829.217891]   GRXSTSR = 0x000E0005
> > [684829.222647] --Host Channel Interrupt--, Channel 0
> > [684829.222659]   hcint 0x00000021, hcintmsk 0x00000426, hcint&hcintmsk 0x00000020
> > [684829.222671]   hcchar[0] = 0x01d8d200, chan->ep_type=2
> > [684829.222681]   GRXSTSR = 0x00070044
> > [684829.222696] --Host Channel Interrupt--, Channel 0
> > [684829.222704]   hcint 0x00000002, hcintmsk 0x00000406, hcint&hcintmsk 0x00000002
> > [684829.222714]   hcchar[0] = 0x01d8d200, chan->ep_type=2
> > [684829.222724]   GRXSTSR = 0x00070044
> > [684829.222740] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: Channel 0 - ChHltd set, but reason is unknown
> > [684829.222758] dwc2 3f980000.usb: hcint 0x00000002, intsts 0x04000009
> 
> 
> Sorry for delayed response.
> I guess the cause of issue is because of channel halted interrupt late 
> for about ~40-50us. In above log, Channel 0 twice assert interrupt: 
> first for ACK (XferComplete masked) and second for Channel_Halted. These 
> all interrupts related to same BULK IN transfer. Ideally these 3 source 
> of interrupt (ACK, XferCompl and ChHalt) should be asserted together.
> To check it lets do follow:
> 1. Do not allow unmask ACK interrupt in function 
> dwc2_hc_enable_dma_ints(). Just comment "hcintmsk |= HCINTMSK_ACK;"
> 2. remove comment for "goto error"
> 3. remove printing GRXSTSR and GNPTXSTS
> 4. build in non verbose debug mode
> It's just temporary solution to check ACK influence on the issue.
> 
> Thanks,
> Minas

Testing the changes you suggested revealed that "ChHltd set, but reason is unknown" error
is not showing up anymore, but we now have some "Transaction error" as shown in the
following log:


[13941.590252]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.590263]  hcchar[5] = 0x00dc8801, chan->ep_type=3
[13941.592240] --Host Channel Interrupt--, Channel 4
[13941.592249]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.592258]  hcchar[4] = 0x015c9810, chan->ep_type=3
[13941.600243] --Host Channel Interrupt--, Channel 2
[13941.600263]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.600273]  hcchar[2] = 0x015c9810, chan->ep_type=3
[13941.605521] --Host Channel Interrupt--, Channel 3
[13941.605539]   hcint 0x00000003, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.605549]  hcchar[3] = 0x01d83200, chan->ep_type=2
[13941.608242] --Host Channel Interrupt--, Channel 6
[13941.608256]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.608266]  hcchar[6] = 0x015c9810, chan->ep_type=3
[13941.609685] --Host Channel Interrupt--, Channel 1
[13941.609696]   hcint 0x00000023, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.609706]  hcchar[1] = 0x01d8d200, chan->ep_type=2
[13941.616243] --Host Channel Interrupt--, Channel 5
[13941.616262]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.616272]  hcchar[5] = 0x015c9810, chan->ep_type=3
[13941.619514] --Host Channel Interrupt--, Channel 0
[13941.619527]   hcint 0x00000023, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.619538]  hcchar[0] = 0x01d8d200, chan->ep_type=2
[13941.620015] --Host Channel Interrupt--, Channel 2
[13941.620027]   hcint 0x00000003, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.620037]  hcchar[2] = 0x01d83200, chan->ep_type=2
[13941.624240] --Host Channel Interrupt--, Channel 3
[13941.624249]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.624259]  hcchar[3] = 0x015c9810, chan->ep_type=3
[13941.627347] --Host Channel Interrupt--, Channel 4
[13941.627363]   hcint 0x00000092, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.627373]  hcchar[4] = 0x01d8d200, chan->ep_type=2
[13941.627391] dwc2 3f980000.usb: --Host Channel 4 Interrupt: Transaction Error--
[13941.627432] --Host Channel Interrupt--, Channel 6
[13941.627440]   hcint 0x00000010, hcintmsk 0x00000416, hcint&hcintmsk 0x00000010
[13941.627450]  hcchar[6] = 0x81d8d200, chan->ep_type=2
[13941.632240] --Host Channel Interrupt--, Channel 1
[13941.632248]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.632257]  hcchar[1] = 0x015c9810, chan->ep_type=3
[13941.635528] --Host Channel Interrupt--, Channel 5
[13941.635543]   hcint 0x00000003, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.635553]  hcchar[5] = 0x01d83200, chan->ep_type=2
[13941.640244] --Host Channel Interrupt--, Channel 0
[13941.640263]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.640272]  hcchar[0] = 0x015c9810, chan->ep_type=3
[13941.642078] --Host Channel Interrupt--, Channel 6
[13941.642086]   hcint 0x00000023, hcintmsk 0x00000406, hcint&hcintmsk 0x00000002
[13941.642095]  hcchar[6] = 0x01d8d200, chan->ep_type=2
[13941.648243] --Host Channel Interrupt--, Channel 3
[13941.648262]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.648272]  hcchar[3] = 0x015c9810, chan->ep_type=3
[13941.652240] --Host Channel Interrupt--, Channel 4
[13941.652248]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.652257]  hcchar[4] = 0x009c8801, chan->ep_type=3
[13941.656241] --Host Channel Interrupt--, Channel 1
[13941.656256]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.656266]  hcchar[1] = 0x015c9810, chan->ep_type=3
[13941.664240] --Host Channel Interrupt--, Channel 5
[13941.664248]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[13941.664257]  hcchar[5] = 0x015c9810, chan->ep_type=3


The ping flood is otherwise working, except for a minor percentage loss (~0.7%).
Many thanks,

Andrea

