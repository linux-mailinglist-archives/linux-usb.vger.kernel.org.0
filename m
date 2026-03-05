Return-Path: <linux-usb+bounces-34087-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IjJNO19qWnA9AAAu9opvQ
	(envelope-from <linux-usb+bounces-34087-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 13:58:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C23212377
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 13:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B170D312DDE4
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 12:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E58B39B4B2;
	Thu,  5 Mar 2026 12:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="Ts1fVfqQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49219.qiye.163.com (mail-m49219.qiye.163.com [45.254.49.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A12239A066;
	Thu,  5 Mar 2026 12:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715306; cv=none; b=EbmGebhwxK3zKO23Rwo2ILY38gDFyZS9zPeAs6m51mgXZmggWr6qlyC5V1ZpI31FS05SV8ZVWNV7VobYg3JF3YY0WvIPN59JFSdLe18m2TEO+271+iEfo/O/7ORp7rPmKU86t11a4SNFCmzmQFYeNu+OfopoZKyO4OuHK/L3+kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715306; c=relaxed/simple;
	bh=qwvSwYba19jJlXmtjjdzLM+ULHTaOqxxHHdeNvPUlUo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MTjhOsOASufPISZVNIVLfOW0QB4coeVuuojMGZC9fc0/BRfEew4Ntp3CK2Kdkd1+PIgB51K3CLn+Ca/yTesBfiul4GzORk1CosLKv/ZeQsiPM56Lw1K/0zTTO5t+ml6C3hIxpdyFqYHoToekXFtFRH4e/KwXpfX9b0j3gPHNFfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=Ts1fVfqQ; arc=none smtp.client-ip=45.254.49.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from localhost (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 35e22f452;
	Thu, 5 Mar 2026 20:19:32 +0800 (GMT+08:00)
Date: Thu, 5 Mar 2026 20:19:30 +0800
From: BaiKefan <baikefan@leap-io-kernel.com>
To: Alex Shi <seakeel@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: si.yanteng@linux.dev, linux-usb@vger.kernel.org, alexs@kernel.org,
 dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
Subject: Re: [PATCH v5 0/8] Add Chinese translation for USB subsystem
Message-ID: <20260305201930.00006c0b@leap-io-kernel.com>
In-Reply-To: <9e1d404b-2145-481d-930d-c3ba5be0a520@gmail.com>
References: <cover.1765180570.git.baikefan@leap-io-kernel.com>
	<20260303194105.00004696@leap-io-kernel.com>
	<2026030412-mystify-ride-9103@gregkh>
	<9e1d404b-2145-481d-930d-c3ba5be0a520@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cbdf05e6c09d5kunm7938b13fcc5c14
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQk1IVk5KHUIaS0seGEJLHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MSVVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=Ts1fVfqQu2zuY/OhsvcltWFJIquLv0WWqk+wuYzZxmtU3erLXvuO2oJIy+R0ZWlM662+e6l+BkYJPbuox/UgeeHH614MdndgTR6OkBCHQ10b7IMqpA8orx7Rnn3zGcOj/6uDDiOSGKSGSANuUtJzfM4MGiJX8PAEDhFGltU/kt//4wHrceKKectPyEZx56A1jmpAIkXuLWcDGvYRdn3G8F/GPRKohzhJK/3lkopNR7PLlkUnZTPeYg8N1Tl0J1rz2QLyKGCWwF1TWqf7gnGYexnJ1cb7ridLfjP4trFXxDU0a24YOEziCgfXr7ePnPtNaUcboG0zvZbQC14jf2DmbQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=Z6f7UgrbRcIQ/IcPMyGkShWzDBGiW/B99fzjRD7oIFs=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Queue-Id: 77C23212377
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[leap-io-kernel.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[leap-io-kernel.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34087-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[leap-io-kernel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baikefan@leap-io-kernel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


Hi Greg, Alex,

To clarify, I did send this patchset to the USB subsystem maintainers
in Dec 2025. At that time, I received Greg’s patch-bot auto-reply
noting the tree was closed during the merge window, so no further
review occurred, which made me assume it had been noted but was still
pending.

Per Alex’s suggestion, I will rebase on the latest docs-next, retest,
and resend to the USB maintainers.

Thanks for your guidance and patience.

Best regards,
Kefan


On Thu, 5 Mar 2026 09:36:39 +0800
Alex Shi <seakeel@gmail.com> wrote:

> Hi Baikefan,
> 
> Please rebase the patchset on latest Jon's tree 
> (git://git.lwn.net/linux.git docs-next) and cc to USB maintainers
> with all testing you past.
> 
> Thanks
> Alex
> 
> On 2026/3/4 22:51, Greg KH wrote:
> > On Tue, Mar 03, 2026 at 07:41:05PM +0800, BaiKefan wrote:  
> >> Hi Yanteng and Alexs,
> >>
> >> A few months ago, I submitted a patch for the Chinese translation
> >> of the USB documentation.
> >>
> >> Following your suggestion, I forwarded it to the USB subsystem
> >> maintainer for further review, but I haven’t received any response
> >> yet.  
> > I do not see the forward to the USB subsystem maintainer, where did
> > that happen?
> > 
> > thanks,
> > 
> > greg k-h  
> 
> 
> 


