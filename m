Return-Path: <linux-usb+bounces-36070-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOmYJCQR1mmxAwgAu9opvQ
	(envelope-from <linux-usb+bounces-36070-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 10:26:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6793B8FB6
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 10:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F0AA307768A
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2026 08:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582DF386426;
	Wed,  8 Apr 2026 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="gWjP370W"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9158339DBF3;
	Wed,  8 Apr 2026 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636454; cv=none; b=RxtYsV64YXWrupogo9cUEQAJApwchDUM7RSy4XwUmKmWuXJFcrqdCUWbmvxyiEHQnXbYWoF3sw9grZ4Bw3VOTWBXubdQddO9M1uxdTZetLhbHKSx81PJ4SINCxdZ9y1Etmf2+MXYz88vrv+yBrzZ1r0J50b+ZpL67lPxGxgOS9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636454; c=relaxed/simple;
	bh=Ap85XTAbnvigCwiU4GMC+VmIAjFDpqkTrV4E8h+d4ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJM4CY4DkzahJ8O5NhR7Zrtov2++vWBrnazTWRt4lhTEpjcRAAbyqAyCMwd7C3cXyoOQkdYou93P53faJTnJqLn7j9c9xbqCadiiM+jCGC/Xai5IOHVlBpKPrBHlmtVvwz4fBdObFS9I5bAsG2najaU7NKAbav39AQo9ge4YIsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=gWjP370W; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1775636352;
	bh=TXy8b4hc5WuVMNGkdYLoKmL6iPX+8CVFMd9n5KSSOqg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gWjP370Wy11n4/k/bntmAusaL/p5t+KAMhMg+tMtTQ36WzoaPaciGQsAE231ca/bl
	 Ha8yBE2XaY0wzOATWX+CpHHkVA8orZcoDBcmvPsqFcU61zQrc2YHaA2yf5T1A5DVB/
	 A2Pns8uMTGHpzuvBIpgbGSdik06knGv8vAUASPNI=
X-QQ-mid: zesmtpip3t1775636334t7b87affe
X-QQ-Originating-IP: Hp4eiQ4ycRFMfB+gGBu2PJpZNA9LajrBXTInIfiiwoU=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 08 Apr 2026 16:18:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13218983909469976630
EX-QQ-RecipientCnt: 12
From: Morduan Zang <zhangdandan@uniontech.com>
To: horms@kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	petkan@nucleusys.com,
	syzbot+9db6c624635564ad813c@syzkaller.appspotmail.com,
	zhangdandan@uniontech.com
Subject: Re: [PATCH] usb: rtl8150: avoid using uninitialized CSCR value
Date: Wed,  8 Apr 2026 16:18:51 +0800
Message-ID: <4A9247C80F1D1581+20260408081851.159023-1-zhangdandan@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260403154538.GA187715@horms.kernel.org>
References: <20260403154538.GA187715@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mutteg8H72qDdbxZBtZbY6yosCzH/pbW7hadsYHtd+rk8VYS9sKROWkQ
	vCV5Dj8I1eGpCg9QZ1K3VgnNn4T3R5FAtr0I3MBv+oVfkI7G7SbPT5zaVE/ny/sCtNFugZ0
	kjB446ol7IySM+knh2UKj66iMhV/Gr6ml+ZRKm+JS/VP12hx0OhLnw9JhuvLl5RhQOkxuxT
	3Tlgr+hG0kD5ZYDY4YDY5wXdTEJd0lZbrinYrgvt4bkd2X346XjstZ7t9pErH2UJA93NN7O
	wlVf0O9mkUXU9GBl97W+tWWfqlhC4hEqe5Pb+80AH8k3wrSX60oLSnQzY8/vDAhEyt3OkNU
	kHo8w4o7gRUSPxLsIH0lDt6rmdzsepfwUvtk6gBIA6mLD17YzckJ+ZNzzIDJWUv9v7x+0av
	/B/6ulTmsYIwzXt2fEnzdapXew0G0Yk5NFxW4i93NjNQXfojV68Bb/6ooC8vUHjbzet0NN+
	ObBIk51d+0nM/A9ofwefpiY/PZNjKC7+yz1tK8oRkor5ATN6oq2yX0bJ5n1vqCB8UjYWCC1
	Yg6e3IQ8k7p5BzvqWXa+n9sa2KMwagiKMijGr/VdH/0Mte9TO0DCwCx/4RA9eI+OOr54w7H
	cLf5P8mlzNgFXvVgQmdYq5OnSYBWr1zlwfjutiPXuiYKJvw5LE8uf/KFk2ASA7ncTcu1jv3
	0XZSxwGLeihs4fM1/KVPM+F0+GF91zScwNGLlE4m0Wad5bIqa+NDUkylEE3V7sk+eDAjDD8
	k6JxIE/L3eLeSRUffq4kIhLUA7gUNp/BM5aoEppELuKOSB07EJQpeogOHovcaJhptpF0VFV
	RJW9c9Umif9Zn46gOz6s/wDi25KgMS8Gjop4ZXQxXYUqZh+doHKIQJvNRfFAGIsXkEIs35j
	aveUQ9wpWdbtSNB/ZtV62/xND1DArBGaPsCp0BA2GorL930VVz3vex2Vi+vzn3erUq/ddAU
	FWcW6OE0zNhfaGtP+Lac1774nH11xfxF2IdytbQkVAipKp/u3/0NhxqiH9gv0mP1pdxSx27
	oL5TrYSg==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36070-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhangdandan@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev,9db6c624635564ad813c];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,uniontech.com:dkim,uniontech.com:mid]
X-Rspamd-Queue-Id: 0E6793B8FB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> I wonder if we can handle this a bit more succinctly,
> while still making it clear that the error is handled.
> Something like this:
> 
> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> index 4cda0643afb6..816759ced56c 100644
> --- a/drivers/net/usb/rtl8150.c
> +++ b/drivers/net/usb/rtl8150.c
> @@ -722,7 +722,8 @@ static void set_carrier(struct net_device *netdev)
>   rtl8150_t *dev = netdev_priv(netdev);
>   short tmp;
>  
> - get_registers(dev, CSCR, 2, &tmp);
> + if (get_registers(dev, CSCR, 2, &tmp) < 0)
> + tmp = 0;
>   if (tmp & CSCR_LINK_STATUS)
>   netif_carrier_on(netdev);
>   else
Thanks for your suggestion.
I agree that errors should be handled explicitly, but I prefer not to force the carrier off
when CSCR read fails. The control transfer error here may be transient, and treating it
as a link break would cause the carrier state to toggle frequently.
Therefore, if the get_registers() call fails, should we keep the previous carrier state and
return directly? (Perhaps with a rate-limited warning as an option), while still avoiding
the use of uninitialized stack values.

If agreed, I will send a v2 incorporating the suggestions. 
 

