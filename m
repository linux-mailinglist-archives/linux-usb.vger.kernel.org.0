Return-Path: <linux-usb+bounces-32877-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D0yCxXteWkF1AEAu9opvQ
	(envelope-from <linux-usb+bounces-32877-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 12:03:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 641699FE53
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 12:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 644AF3029AE5
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 11:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F251333D4E4;
	Wed, 28 Jan 2026 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mr63gKYY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7903B32BF43;
	Wed, 28 Jan 2026 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598062; cv=none; b=NVvOFk436Bsj7oVrZKeso0UWbNV5HMlEsUuyM0vzGmWF7XfyT2jjcV9KzEJKlwBOcq9EVN7fZ80iGHH2A6kA8dsrgyU0YxjeWX7iMmV0JcOtOAecznrK68aElvZSjOjUY6Eb+fJ9JfOlvUQEI6T8D4YzTPWdgkTk3+2VEQ/KAEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598062; c=relaxed/simple;
	bh=28A3RLsDnARJPIOQ1eFzcJB9nfg+wpEpl/P4q663pug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzKPLDh7dKueu1QYQt3+l4quWrK8QTWbP84QeqnJlvYla1Y1XGa4s7kuSnuy4PWzwvnwImTDZZSwqb/dB4GBWeMW0q6X2tTYPMjBdLzwVPBkMFnoF9GHVWdKREjpiabh8bTWExofuOGOnEctCxo365IkaTwjChXGbQJdpSSc69U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mr63gKYY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF509C16AAE;
	Wed, 28 Jan 2026 11:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769598062;
	bh=28A3RLsDnARJPIOQ1eFzcJB9nfg+wpEpl/P4q663pug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mr63gKYYgpOusVZiakBtOIuv+9J5qhqMaKDDREBKGCRy7AxQ6yxtuexGebtd2tVF9
	 xinS4yziMgEHN9RJFrB/9o2/eC+jwEIeIKLw157Gy49UEo8mzKdBEaCH2t22D4eoTf
	 rk5gr0q/9BwAiSdRAaqz3Xmt1FN4yr0rMkYWbZrY=
Date: Wed, 28 Jan 2026 12:00:59 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: LI Qingwu <qing-wu.li@leica-geosystems.com.cn>
Cc: "hgajjar@de.adit-jv.com" <hgajjar@de.adit-jv.com>,
	"eugeniu.rosca@bosch.com" <eugeniu.rosca@bosch.com>,
	"guofeng.li@gm.com" <guofeng.li@gm.com>,
	"hardik.gajjar@bosch.com" <hardik.gajjar@bosch.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"maze@google.com" <maze@google.com>,
	"quic_kriskura@quicinc.com" <quic_kriskura@quicinc.com>,
	"quic_linyyuan@quicinc.com" <quic_linyyuan@quicinc.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix Kernel Panic due to access of
 invalid gadget ptr
Message-ID: <2026012820-eldercare-crewless-34ff@gregkh>
References: <GV2PR06MB10809D32F05C864813CC36C10D791A@GV2PR06MB10809.eurprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR06MB10809D32F05C864813CC36C10D791A@GV2PR06MB10809.eurprd06.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32877-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 641699FE53
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 10:49:02AM +0000, LI Qingwu wrote:
> > On Mon, Mar 11, 2024 at 01:04:18PM +0100, Hardik Gajjar wrote:
> > > On Fri, Mar 08, 2024 at 05:47:37PM +0530, Krishna Kurapati PSSNV wrote:
> > > > 
> > > > 
> > > > On 3/8/2024 5:25 PM, Hardik Gajjar wrote:
> > > > > On Thu, Mar 07, 2024 at 11:12:07PM +0530, Krishna Kurapati PSSNV wrote:
> > > > > > 
> > > > 
> > > > [...]
> > > > 
> > > > > 
> > > > > I believe using gether_cleanup altogether may not be an optimal solution.
> > > > > The creation and deletion of network interfaces should align with the behavior of each specific network driver.
> > > > > 
> > > > > For instance, in the case of NCM, the usb0 interface is created upon the creation of a directory
> > > > > in config/usb_gadget/gX/functions/ncm.usb0, and it is removed when the corresponding directory
> > > > > is deleted. This follows a standard flow observed in many network drivers, where interfaces are
> > > > > created during driver loading/probing and deleted during removal.
> > > > > 
> > > > 
> > > > Hi Hardik,
> > > > 
> > > >  Yeah. I observed this behavior.
> > > > 
> > > > > Typically, deleting the gadget on every disconnection is not considered a good practice, as it can
> > > > > negatively impact the user experience when accessing the gadget.
> > > > > 
> > > > 
> > > > Got it. I was suspecting issues might come up during fast Plug-In/ Plug-Out
> > > > cases as setting and cleanup of network interface might take some time.
> > > > 
> > > > > In our specific scenario, retaining the usb0 network interface has proven to enhance performance
> > > > > and stabilize connections. Previous attempts to remove it resulted in an observed increase in time of 300ms,
> > > > > particularly at the start of Apple CarPlay sessions.
> > > > > 
> > > > 
> > > > Thanks for this info. Makes sense to keep it in free_inst only. But my
> > > > initial doubt only stemmed from the fact that actions taken during bind must
> > > > be reversed during unbind.
> > > > 
> > > > > Furthermore, it's important to highlight that in Qualcomm products and msm kernels, the inclusion of gether_cleanup
> > > > > in the unbind process was eventually reverted. While the specific reason for reverting the patch is unknown,
> > > > > it suggests that the addition may not have yielded the intended or required results
> > > > > 
> > > > > Following is the revert patch details in msm-5.4 kernel, if you want check it.
> > > > > 
> > > > > Revert "usb: gadget: f_ncm: allocate/free net device upon driver bind/unbind"
> > > > > 
> > > > > This reverts commit 006d8adf555a8c6d34113f564ade312d68abd3b3.
> > > > > 
> > > > > Move back the allocation of netdevice to alloc_inst(), one-time
> > > > > registration to bind(), deregistration and free to rm_inst(). The
> > > > > UI update issue will be taken up with proper stakeholders.
> > > > > 
> > > > > Change-Id: I56448b08f6796a43ec5b0dfe0dd2d42cdc0eec14
> > > > > 
> > > > 
> > > > Agree. This was merged first in 4.19 downstream (most probably for car play
> > > > use case only) and then reverted in 5.4. But present 4.19 code in QC still
> > > > keeps it in unbind path. The only reason I suspect it was reverted was to
> > > > get back on to same page with upstream driver (atleast starting from 5.10,
> > > > this was the reasoning to remove gether_cleanup in unbind path and put it
> > > > back in free_inst).
> > > > 
> > > > Thanks,
> > > > Krishna,
> > > 
> > > Thanks Krinshna for your comment
> > > Come to the first comment from Greg. 
> > > 
> > > > What commit id does this fix?
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > > 
> > > >Hi Greg,
> > > 
> > > >The network device parent is not being properly cleaned up during unbind since the \
> > > >initial commit of the driver. In that case, should I mention the First commit ID of \
> > > >the driver as broken commit or would you advice to say, For example "Clean up netdev \
> > > >parent in unbind".
> > > 
> > > >Thanks,
> > > >Hardik
> > > 
> > > @Greg, 
> > > 
> > > Can you please provide guidance on how to proceed? Should I update the commit message to exclude the term 'Fix' in the title?
> > > 
> > > Thanks,
> > > Hardik
> > 
> > Hi Greg,
> > 
> > Should we move forward if there are no further comments?
> > 
> > Thanks,
> > Hardik
>   
> 
> Hi Hardik and all,
> 
> Gentle ping on this patch. I wanted to follow up on the status and see if
> there have been any updates or alternative fixes applied.
> 
> I have recently tested this patch on NXP iMX8MP platforms and can confirm it
> successfully resolves the use-after-free panic issue.

I have no context of what patch is being discussed here, sorry.  It
seems this needs to be resent with the proper information added (i.e. a
Fixes: tag and the like.)

thanks,

greg k-h

