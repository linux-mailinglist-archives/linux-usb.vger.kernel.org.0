Return-Path: <linux-usb+bounces-3397-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABE17FB516
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 10:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D89A1C210A4
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 09:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC191358AA;
	Tue, 28 Nov 2023 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BD419D
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 01:00:12 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1B1E521989;
	Tue, 28 Nov 2023 09:00:11 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id F3CCA139FC;
	Tue, 28 Nov 2023 09:00:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id gqFUORqsZWXqSAAAn2gu4w
	(envelope-from <aporta@suse.de>); Tue, 28 Nov 2023 09:00:10 +0000
Date: Tue, 28 Nov 2023 10:00:10 +0100
From: Andrea della Porta <aporta@suse.de>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: Oliver Neukum <oneukum@suse.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Ivan Ivanov <ivan.ivanov@suse.com>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Message-ID: <ZWWsGknhNuVggNNa@apocalypse>
Mail-Followup-To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
	Oliver Neukum <oneukum@suse.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Ivan Ivanov <ivan.ivanov@suse.com>,
	Andrea della Porta <andrea.porta@suse.com>
References: <20231115144514.15248-1-oneukum@suse.com>
 <f0bd323a-8384-e303-907f-5d533af6d71e@synopsys.com>
 <ZWRbkdTASTNJB8Fv@apocalypse>
 <f293d306-54fb-ecb5-4515-70a6c1faf1b1@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f293d306-54fb-ecb5-4515-70a6c1faf1b1@synopsys.com>
X-Spamd-Bar: +++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.de (policy=none);
	spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither permitted nor denied by domain of aporta@suse.de) smtp.mailfrom=aporta@suse.de
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [3.30 / 50.00];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_SPF_SOFTFAIL(4.60)[~all:c];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-0.99)[-0.988];
	 MIME_GOOD(-0.10)[text/plain];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_TLS_ALL(0.00)[];
	 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
X-Spam-Score: 3.30
X-Rspamd-Queue-Id: 1B1E521989

Hi Minas,

On 10:46 Mon 27 Nov     , Minas Harutyunyan wrote:
> Hi Andrea,
> 
> On 11/27/23 13:04, Andrea della Porta wrote:
> > On 12:35 Wed 22 Nov     , Minas Harutyunyan wrote:
> >> Hi Oliver,
> >>
> >> On 11/15/23 18:45, Oliver Neukum wrote:
> >>> dwc2_hc_n_intr() writes back INTMASK as read but evaluates it
> >>> with intmask applied. In stress testing this causes spurious
> >>> interrupts like this:
> >>>
> >>> [Mon Aug 14 10:51:07 2023] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: Channel 7 - ChHltd set, but reason is unknown
> >>> [Mon Aug 14 10:51:07 2023] dwc2 3f980000.usb: hcint 0x00000002, intsts 0x04600001
> >>> [Mon Aug 14 10:51:08 2023] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: Channel 0 - ChHltd set, but reason is unknown
> >>> [Mon Aug 14 10:51:08 2023] dwc2 3f980000.usb: hcint 0x00000002, intsts 0x04600001
> >>> [Mon Aug 14 10:51:08 2023] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: Channel 4 - ChHltd set, but reason is unknown
> >>> [Mon Aug 14 10:51:08 2023] dwc2 3f980000.usb: hcint 0x00000002, intsts 0x04600001
> >>> [Mon Aug 14 10:51:08 2023] dwc2 3f980000.usb: dwc2_update_urb_state_abn(): trimming xfer length
> >>>
> >>> Applying INTMASK prevents this. The issue exists in all versions of the
> >>> driver.
> >>
> >> I'm Ok with this patch, just need some elaboration.
> >> So, channel halted interrupt asserted due to some other interrupt (AHB
> >> Error, Excessive transaction errors, Babble, Stall) which was masked.
> >> Can you check which of masked interrupts is cause of channel halt interrupt?
> >>
> >> Thanks,
> >> Minas
> >>
> > 
> > Hi Minas,
> > here's the report from dmesg:
> > 
> > [209384.238724]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
> > [209384.246725]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
> > [209384.247634]   hcint 0x00000003, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
> > [209384.254722]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
> > [209384.262725]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
> > [209384.270724]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
> > [209384.278336]   hcint 0x00000092, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
> > [209384.278384]   hcint 0x00000010, hcintmsk 0x00000436, hcint&hcintmsk 0x00000010
> > [209384.278720]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
> > [209384.286723]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
> > [209384.288486]   hcint 0x00000021, hcintmsk 0x00000426, hcint&hcintmsk 0x00000020
> 
> > [209384.288511]   hcint 0x00000002, hcintmsk 0x00000406, hcint&hcintmsk 0x00000002
> According your patch terminology above 'hcint' is a 'hcintraw' and here 
> asserted only channel halted interrupt. So, channel halted without any 
> reason. Not clear how your patch fix this case?
> 
> Couple of questions related to your tests:
> 1. Which DMA mode used here - buffer or descriptor DMA?
> 2. Which type of transfers testing? Or you can add to this print HCCHARx 
> also.
> 3. Which version of core you use (GSNPSID)?
> 
> Thanks,
> Minas
>

The augmented log is here below (hcchar[chnum] and others added):

[330438.623017] --Host Channel Interrupt--, Channel 4
[330438.623029]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[330438.623039]   hcchar[4] = 0x015c9810, chan->ep_type=3
[330438.626183] --Host Channel Interrupt--, Channel 5
[330438.626198]   hcint 0x00000003, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[330438.626208]   hcchar[5] = 0x01d83200, chan->ep_type=2
[330438.627659] --Host Channel Interrupt--, Channel 3
[330438.627674]   hcint 0x00000021, hcintmsk 0x00000426, hcint&hcintmsk 0x00000020
[330438.627686]   hcchar[3] = 0x01d8d200, chan->ep_type=2
[330438.627703] --Host Channel Interrupt--, Channel 3
[330438.627711]   hcint 0x00000002, hcintmsk 0x00000406, hcint&hcintmsk 0x00000002
[330438.627721]   hcchar[3] = 0x01d8d200, chan->ep_type=2
[330438.627740] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: Channel 3 - ChHltd set, but reason is unknown
[330438.627758] dwc2 3f980000.usb: hcint 0x00000002, intsts 0x04600001
[330438.627798] --Host Channel Interrupt--, Channel 0
[330438.627807]   hcint 0x00000010, hcintmsk 0x00000436, hcint&hcintmsk 0x00000010
[330438.627818]   hcchar[0] = 0x81d8d200, chan->ep_type=2
[330438.631017] --Host Channel Interrupt--, Channel 1
[330438.631025]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[330438.631035]   hcchar[1] = 0x015c9810, chan->ep_type=3
[330438.639019] --Host Channel Interrupt--, Channel 7
[330438.639041]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[330438.639053]   hcchar[7] = 0x015c9810, chan->ep_type=3
[330438.647019] --Host Channel Interrupt--, Channel 6
[330438.647040]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002
[330438.647051]   hcchar[6] = 0x015c9810, chan->ep_type=3
[330438.649015] --Host Channel Interrupt--, Channel 4
[330438.649020]   hcint 0x00000012, hcintmsk 0x00000006, hcint&hcintmsk 0x00000002

we're using buffer DMA mode (dma_desc_enable=0), we are atrss testing via ping flooding
through an LTE modem attached to USB which should mostly do bulk dataflow (confirmed
by ep_type==2). From regdump, GSNPSID = 0x4f54280a.

Many thanks,
Andrea
 
> >>>
> >>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> >>> Tested-by: Ivan Ivanov <ivan.ivanov@suse.com>
> >>> Tested-by: Andrea della Porta <andrea.porta@suse.com>
> >>> ---
> >>>    drivers/usb/dwc2/hcd_intr.c | 15 +++++++--------
> >>>    1 file changed, 7 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/drivers/usb/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
> >>> index 0144ca8350c3..5c7538d498dd 100644
> >>> --- a/drivers/usb/dwc2/hcd_intr.c
> >>> +++ b/drivers/usb/dwc2/hcd_intr.c
> >>> @@ -2015,15 +2015,17 @@ static void dwc2_hc_n_intr(struct dwc2_hsotg *hsotg, int chnum)
> >>>    {
> >>>    	struct dwc2_qtd *qtd;
> >>>    	struct dwc2_host_chan *chan;
> >>> -	u32 hcint, hcintmsk;
> >>> +	u32 hcint, hcintraw, hcintmsk;
> >>>    
> >>>    	chan = hsotg->hc_ptr_array[chnum];
> >>>    
> >>> -	hcint = dwc2_readl(hsotg, HCINT(chnum));
> >>> +	hcintraw = dwc2_readl(hsotg, HCINT(chnum));
> >>>    	hcintmsk = dwc2_readl(hsotg, HCINTMSK(chnum));
> >>> +	hcint = hcintraw & hcintmsk;
> >>> +	dwc2_writel(hsotg, hcint, HCINT(chnum));
> >>> +
> >>>    	if (!chan) {
> >>>    		dev_err(hsotg->dev, "## hc_ptr_array for channel is NULL ##\n");
> >>> -		dwc2_writel(hsotg, hcint, HCINT(chnum));
> >>>    		return;
> >>>    	}
> >>>    
> >>> @@ -2032,11 +2034,9 @@ static void dwc2_hc_n_intr(struct dwc2_hsotg *hsotg, int chnum)
> >>>    			 chnum);
> >>>    		dev_vdbg(hsotg->dev,
> >>>    			 "  hcint 0x%08x, hcintmsk 0x%08x, hcint&hcintmsk 0x%08x\n",
> >>> -			 hcint, hcintmsk, hcint & hcintmsk);
> >>> +			 hcintraw, hcintmsk, hcint);
> >>>    	}
> >>>    
> >>> -	dwc2_writel(hsotg, hcint, HCINT(chnum));
> >>> -
> >>>    	/*
> >>>    	 * If we got an interrupt after someone called
> >>>    	 * dwc2_hcd_endpoint_disable() we don't want to crash below
> >>> @@ -2046,8 +2046,7 @@ static void dwc2_hc_n_intr(struct dwc2_hsotg *hsotg, int chnum)
> >>>    		return;
> >>>    	}
> >>>    
> >>> -	chan->hcint = hcint;
> >>> -	hcint &= hcintmsk;
> >>> +	chan->hcint = hcintraw;
> >>>    
> >>>    	/*
> >>>    	 * If the channel was halted due to a dequeue, the qtd list might

