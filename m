Return-Path: <linux-usb+bounces-33780-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEUXCYh6oWkUtgQAu9opvQ
	(envelope-from <linux-usb+bounces-33780-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 12:05:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB051B6578
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 12:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94FD23028352
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 11:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1B63ECBFA;
	Fri, 27 Feb 2026 11:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfTK60Fx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B6A3ACF16
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772190340; cv=none; b=Nts39+UaLXDR1WPfEEFgG3U3G+vH/5Iylmbkh31VaBb1HBllshNpTZEn5TXUgpyhDKERDpGVQUpNdjHERz15VaFIvVLWR2tJUn0IXrsKEGjJXw6PgrkWh/rppwBoJqw7Vp4oHPzJ1/Xv9Nr6+Gj7QSYFGykt46Gxn+7kstWD3SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772190340; c=relaxed/simple;
	bh=K7/dqLGhzaE4SqXmDnBlTcJ4PFnNjTIs0xCN2zVIBVE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u/mbS3fby1/qtMlWQwevcfN0J03SgPkYGLdRKti8nKvc44+tmRtWgUdKJLDpPfDUwWoOVZfvpV4O3TJKl71Wu1uTXpoC3w0lB98JshowD8kvT/ZKpdDM9pOYA2d8F5K+XQes83NuwVJybwmxQS43vyfZOnz1A/6bgNMPXVlfM/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfTK60Fx; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65a43a512b0so2244033a12.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 03:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772190337; x=1772795137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7/dqLGhzaE4SqXmDnBlTcJ4PFnNjTIs0xCN2zVIBVE=;
        b=GfTK60FxzU6UR293EF8r+RBBfdPPRDLGIDgjPEsE9uao6vnT08NhlKSCyXzd+ac1UB
         FUaMfeTO0P6Q5DRbmEPqZ0ecwLOzlLke+9pH6ldmxak2ft9wF8W8LknVTTgNDLvR+eJJ
         bsOYeyJHE3A2ZZY2Cnm6lzua0f+qlxOjCLISz2SnHlUhW1LdZyK8EpuqoEfOTyeXONXm
         aFrOfORAjVzh0pZEgGH/8fmomyTvC8cfygJ7qtcTOo3xnTcOkpP/WzgxH8nx4csgfv32
         ODA8STdC8dXpPwcRvT05jWl7QGE88Dv8O8KmY7jyH3T0YTfjtwHm7l26lQovjdEgrIhs
         CQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772190337; x=1772795137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K7/dqLGhzaE4SqXmDnBlTcJ4PFnNjTIs0xCN2zVIBVE=;
        b=gz3wM9mmtthbPcNUFq4zFsXTW92r+TVZ6+wohKWFABlK6jg4YwR3EeBwMAHnFgCvCA
         Zb/wULY2s+b48m7dI0qeArVLZm6AwK7T8i2jmgfwEiV8uLqmsvKu0bOd7LQksYYNBfnO
         wiQSKqLhRNQ6wC2DF6jVDRSwQBpNB1AO5P62+R2qJ1bcY+n9ekvZ9Sits6/2fbb0T1Zb
         foZyg5/wwX85UHKXwrYJaCU9DENqIZBvy43GzD+1H9dpNBVqPGc6z4vqO9vmKP+UYGz2
         tLzjeWF1X529CCPfIv5HPtRrQImlZxhOUOioS48nQ0GzTUrmgDV4zzGyoj0MmBS9YxsL
         bdYw==
X-Forwarded-Encrypted: i=1; AJvYcCXN/cBWLUumPhtdDikBE/cBrkWYvMSXmCYoYjLzeV6wS3lcuLlxHeXitTarZHbUDLBAscJnBdzgqew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2KGvUqEVKLgoDT2jSxvPo52kg9HhymBqT9nr+m0+L6W57nVgd
	aoKkO584ECaxB2xZe8rv3S/GRa5zsmDqIRjddW3TrHKiT2y7bsbQnGu+
X-Gm-Gg: ATEYQzze6+SGqncooFZYCbUOdzSSzDpOjEek0p2AOJ0m810cHKxPJKEeNd4JikuhLcN
	QKfxSRr3EwrjMnjHilBUJYBU6trsEtajfzwUUlpA9hcAI1slO+K8hG4INRg4iBUIzQ4BpfkNTtq
	z4BYhJDybPSBN9+D88VrDiq/9nm1MjxIewaLvsLy0t/96fPWcRgHJmrgoK71BGvG4nueNkMeg8l
	eYansLi7O1MmnIXwXFtZ0GAlKRzx2qP1Dj49aKKTd/DInr89VLFe6KJP8nCE/LsUXPN1XzsTxVu
	OLZmeKE0MvbiFsc9CNb44As9EVLZpg5ajF/FtJBrnqbvsLkCGXAIPdSIQIy/i/NYtLK/c+F3r13
	Ro7Hi30MCikoQMvT63dnGrtngSeWEWsdqYlw6HCfGRueKlpaf2XF+F40VH3bd0VdW+xyjQt2fik
	9Q794QTkbikcpX4iq1fUPYsE94kLVkYzbMYBVwkuxGvNA=
X-Received: by 2002:a17:906:9fc8:b0:b88:4c99:bc0e with SMTP id a640c23a62f3a-b93763d2329mr153686166b.26.1772190336989;
        Fri, 27 Feb 2026 03:05:36 -0800 (PST)
Received: from foxbook (bfj19.neoplus.adsl.tpnet.pl. [83.28.47.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06dc16sm1199582a12.23.2026.02.27.03.05.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 27 Feb 2026 03:05:36 -0800 (PST)
Date: Fri, 27 Feb 2026 12:05:30 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Dayu Jiang
 <jiangdayu@xiaomi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Longfang Liu
 <liulongfang@huawei.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, yudongbin <yudongbin@xiaomi.com>, guhuinan
 <guhuinan@xiaomi.com>, chenyu45 <chenyu45@xiaomi.com>, mahongwei3
 <mahongwei3@xiaomi.com>, Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Message-ID: <20260227120530.13395d2f.michal.pecio@gmail.com>
In-Reply-To: <9113319a-b82c-42c7-ba1a-19113a5edb80@linux.intel.com>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
	<2026012708-liability-sincere-5ed4@gregkh>
	<aXnNcQa5Ooq2wIX2@oa-jiangdayu.localdomain>
	<2026012857-deprive-putdown-0ee8@gregkh>
	<aaAR5VOtnMhvoCem@oa-jiangdayu.localdomain>
	<871991ab-6c8f-47d4-a5b4-b65751750e71@linux.intel.com>
	<20260226181715.ofgjiq3iq7d7dx6y@synopsys.com>
	<9113319a-b82c-42c7-ba1a-19113a5edb80@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33780-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,usbcmd.run:url]
X-Rspamd-Queue-Id: 8CB051B6578
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 11:43:45 +0200, Mathias Nyman wrote:
> On 2/26/26 20:17, Thinh Nguyen wrote:
> > The controller is halted if there's an error like HCE. It's odd to
> > try to "halt" it again. Not sure how this will impact for other
> > controllers.
> The host is messed up at this point, and we are not recovering it.
> I don't think there is any harm in a manual halt at this stage.

Specifically, calling xhci_halt() clears the USBCMD.Run flag and
all USBCMD interrupt enable flags. Seems relatively harmless. Clearing
USBCMD.Run would be the first step of resetting the HC anyway, so the
HW should expect it to happen afetr reporting HCE.

In case of HSE the HW should clear the Run bit by itself (4.10.2.6),
but no such requirement seems to exist for HCE (4.24.1).

The call also sets XHCI_STATE_HALTED and CMD_RING_STATE_STOPPED flags,
which helps with recovering stuck URBs. When class drivers time out
and unlink them, the URBs are given back instantly without drama.

I just tested the HSE case where xhci_halt() is already being called
and it worked for me. If I remove xhci_halt() then the driver tries to
issue Stop Endpoint commands, times out and calls hc_died(). Messy.
I suspect that the same happened with HCE before this patch.

Regards,
Michal

