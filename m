Return-Path: <linux-usb+bounces-32538-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKVLJ7yub2lBGgAAu9opvQ
	(envelope-from <linux-usb+bounces-32538-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 17:35:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9763B47AD7
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 17:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6BD79785C7F
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 14:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2846444CF47;
	Tue, 20 Jan 2026 14:39:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B2744CF29;
	Tue, 20 Jan 2026 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919979; cv=none; b=Cz5qPiUO85WuY/bhBZ69oF7qWyRma4cjNHWmkaqiA2gz01ONUO4EauDSI/3ur3nqqLSXduZ41/IeqUJHTGN94eymNX/i/Vvn9noFKporraQJyXNZV8qyUeQrD/6Aj2P43Cx7bdHUEnvNvVIgT5fm+NuPdSdJ/85laitjnQAfzPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919979; c=relaxed/simple;
	bh=LZ4ECgjjYb0rkhikXmS4qFstZJnprV62BUMQ9Qxxcws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZ8ugipznHYXRkNbXYxOH076KhUPKPZr7W0dBN1Z+hU7k6CHV/Uh3NwZCqc5P2wM46oOr7Z9aF2PA2SAX8eDXNq5dMtULyM+mJemZBT7plFMTkJ9+7+Fn/xzvf/yY5pWjGoYzCPapZXIYp4FZdPwFwu7oLn+raWCQ5X3Toh7mUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [183.192.221.134])
	by APP-05 (Coremail) with SMTP id zQCowACnPRF+k29p+FrJBQ--.27076S2;
	Tue, 20 Jan 2026 22:38:55 +0800 (CST)
Date: Tue, 20 Jan 2026 22:38:54 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: vkoul@kernel.org, conor@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add USB support for Canaan K230
Message-ID: <aW+Tfl5ohCwVBr9T@duge-virtual-machine>
References: <20260119093836.316007-1-jiayu.riscv@isrc.iscas.ac.cn>
 <aW5WyizgDyQJaKLQ@duge-virtual-machine>
 <2026012036-refuse-reply-a363@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026012036-refuse-reply-a363@gregkh>
X-CM-TRANSID:zQCowACnPRF+k29p+FrJBQ--.27076S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZryDWFWUJF18ur15CFyrtFb_yoWxKwc_Wr
	n7CFs7Cwn8Jrn8C3Z7KF95Aa13t34vga4rJwn5J39aqr9xXF43JayFgr95twnrZws2qrZI
	9FWqqw1DZw12vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUzOJ5UUUUU
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-Spamd-Result: default: False [0.74 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32538-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiayu.riscv@isrc.iscas.ac.cn,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 9763B47AD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 07:06:54AM +0100, Greg KH wrote:
> On Tue, Jan 20, 2026 at 12:07:38AM +0800, Jiayu Du wrote:
> > On Mon, Jan 19, 2026 at 05:38:31PM +0800, Jiayu Du wrote:
> > 
> > This is series is the RESEND of the series here[1]. I resend it
> > because I mistakenly sent the wrong USBPHY driver code.
> > 
> > Link: https://lore.kernel.org/all/20260119093836.316007-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]
> > ]
> > 
> 
> I have no idea which is which anymore, sorry.  Please send out a v4 so
> we know which to look at.
> 
> confused,
> 
> greg k-h

So sorry for that, I have sent the v4[1]. Please ignore the v3.

Link: https://lore.kernel.org/all/20260120143243.71937-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]

Sincerely,

Jiayu Du


