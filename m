Return-Path: <linux-usb+bounces-35682-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIg0IUmPymlC+AUAu9opvQ
	(envelope-from <linux-usb+bounces-35682-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 16:57:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B51235D47E
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 16:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C80C830C0E18
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 14:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A75532572F;
	Mon, 30 Mar 2026 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P1I5Jb1Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09125324B31;
	Mon, 30 Mar 2026 14:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882146; cv=none; b=R/tophmy+AYrllcJjPeIB7Mas+/ATcakWNqPUrfTWmPDJKkdBglWq3vo6sUr2Nkg3O3CkaTcn2zlTvcJP8Xep1lcQ8qe2DSYhE/cdpBOCpgnTMS2AK/d29QT/M3sq5pd1yNPYUDdRvgv1HW4zGK2e0I6WF1XS+CIr03PgcpZeYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882146; c=relaxed/simple;
	bh=wPYsw/26KE1S75IaJ0ipl3L6zzAJuNwbO7rh6w6Qy0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMch2THW9xm/4k/B9LKjF3AS3+w3qx6So63/H31zNGSPMnLd/1sZ8cxdTjNuMAX3ioXjQinLW/dVohkMX0imSqI7ztiK/1IAzopQgpmcbIni5Akhb4nc+8jB+nmPxSSooM6KRcEvS2IUQa5dqCmKqgtVrMFF77zuvVbK/dG+7HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P1I5Jb1Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EA9C2BCB1;
	Mon, 30 Mar 2026 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774882145;
	bh=wPYsw/26KE1S75IaJ0ipl3L6zzAJuNwbO7rh6w6Qy0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1I5Jb1Y9l1EaQysMfDivQJ/tdZvSk9md5NYV+T+tmfeQO3LOjTdxMIvR37HqebFf
	 4Ch0uK42NTlT66afr6y+lnO+KWtzUDvYuI96DAkvzYMXq2E0Gm7hpxQhzS+kvm/N/h
	 wi0dYFTviuxiPhbi+FMdhcVpOUuacImYGh5QalCg=
Date: Mon, 30 Mar 2026 16:49:02 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: =?utf-8?B?6Im+6LaF?= <aichao@kylinos.cn>, b-liu <b-liu@ti.com>,
	johan <johan@kernel.org>, badhri <badhri@google.com>,
	"heikki.krogerus" <heikki.krogerus@linux.intel.com>,
	"valentina.manea.m" <valentina.manea.m@gmail.com>,
	shuah <shuah@kernel.org>, i <i@zenithal.me>, tiwai <tiwai@suse.de>,
	kees <kees@kernel.org>,
	"christophe.jaillet" <christophe.jaillet@wanadoo.fr>,
	"prashanth.k" <prashanth.k@oss.qualcomm.com>,
	khtsai <khtsai@google.com>, tglx <tglx@kernel.org>,
	mingo <mingo@kernel.org>, linux-usb <linux-usb@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH 6/6] usbip: vhci_sysfs: Use safer strscpy() instead of
 strcpy()
Message-ID: <2026033047-joystick-blimp-0be8@gregkh>
References: <7990xi1aonqb-79968wxve9t0@nsmail8.2--kylin--1>
 <b3a6543a-9375-4e52-960e-3f8dc4be5526@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3a6543a-9375-4e52-960e-3f8dc4be5526@linuxfoundation.org>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35682-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kylinos.cn,ti.com,kernel.org,google.com,linux.intel.com,gmail.com,zenithal.me,suse.de,wanadoo.fr,oss.qualcomm.com,vger.kernel.org,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email,kylinos.cn:email]
X-Rspamd-Queue-Id: 2B51235D47E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 12:19:24PM -0600, Shuah Khan wrote:
> On 3/25/26 04:57, 艾超 wrote:
> > Dear Shuah:
> > 
> > Test Report for [usbip: vhci_sysfs: Use safer strscpy() instead of strcpy()]
> > Environment:
> > Kernel Version: v6.12.76+ (with patch applied)
> > Hardware/QEMU: Thinkpad E15
> 
> 
> > Conclusion:
> > The longth of the name is MAX_STATUS_NAME+1 = 17, used the strcpy copy "status-abcdefghijklmnopqrstuvwxyz1234567890" in name and used strscpy copy "status-abcdefghi" in name.
> > Tested-by: Aichao@kylinos.cn
> > 
> 
> Thank you for the report.
> 
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> Greg, Please pick this patch up.

Can someone resend it please, I can't seem to find it anywhere on its
own.

thanks,

greg k-h

