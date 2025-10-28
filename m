Return-Path: <linux-usb+bounces-29792-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D62CCC15638
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 16:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1646C1B24D78
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 15:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4B733F8A9;
	Tue, 28 Oct 2025 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TF56fZeM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58F62FFDFC
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761664806; cv=none; b=BP9MPZoLRzndvx8LMG1S04+mp0V2YK00LtdSST4RcjukXqkHNn45WzCCAKl5X6G4lR9+8Sy2xL/tIkA8sLS2lDHUIWneV39w/DUa+t+dF1kusXlV9WqKMoK3pIadF5zxdme8nUN/298bpYs2Dczoo/C1cGsDStWLs8E4EkKSsrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761664806; c=relaxed/simple;
	bh=s4Gx6QagiTUE1mIaeDbONB9+Ep16cr+q0GGk6X8s7jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JA4tLqL3d+nn3qS+meiYW8tqEXiGPQFI98nHY7kfmm5GxhNVkJ4uh09jtJL0W3SpBjQ+cj/jSD+h1HocUrgAEVVjtSCrSf6qPTP+Vc2heAUEsSE3mwRkxl90k96xfaSopvGO7aDfltjEDdLOH0LBabcruUbb13oBY1s5s1zNfeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TF56fZeM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-475de184058so15276415e9.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 08:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761664801; x=1762269601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g4xM4gK6/cv+oBkMKfsDBfGRWPzGwfaysxJmVNv0Gpw=;
        b=TF56fZeMJfUYiZDzHgEXEBErcxhwGL2kWDZCu8XtcpruE1LQroQdNkUzsrZ7RskTLt
         s7Le6jVDSg9s6r3sPmj9SZ9PGUk5bWnQObnBChD8dq8TDM8+ORj9Z59wWxSkMJ14Hbwp
         SNnSzwAnIey0gfb3JeMuIHg+ImD3UcnnxMmUj2OD3OJ6NWM3TO1Pbdx5WESyEVM8OBPv
         qDLWDw68wnNrkHFYqzUP1gw+uijuykVKFpxsRjU/j0rhCmCSIGh4RDmxRHwBAK8U33+o
         nq7qL42W/0m3KN0exH1mYJ4E6dYYYFDXCbwKMFGRhYHEQveNPPpTJx5xS7W2OFWSDfyO
         jYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761664801; x=1762269601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4xM4gK6/cv+oBkMKfsDBfGRWPzGwfaysxJmVNv0Gpw=;
        b=c3O4HJm9Fux6FOphKVnjGChH8zcboB0UIS094Z3P4h1Gw7tXOLsOpKHQ+oOvukyobs
         1za3zn2GaNV8NBvgs6jNQB3JI82e4o1/pa3Z0SqxFGB1nopuFK04qKIj3ixCEcnmm+0M
         6G6+izwem8sWZw5aAlFetZ8YueTbCNzYTVsiLomiPzgY/ECaEPoHMdqEYJTkzrosYQ8o
         G68hHlmgXSdJDfTaLBwHDY7SGhZoo+vnPutRi4rW0Nrr0LL+gcWYvfgaLiXyT14gt4Zn
         B0gJFiuCxa2x9p0K1K01NsJf4Uh4KjFatiOmkXmW4K7hpnL8mg8mTZlB75D3Erhd8QO/
         /9GA==
X-Forwarded-Encrypted: i=1; AJvYcCUilbWZ5PT6CbXvcbkEbJG9qNHn7h6fbGj2MwmOpvrubwc/m6ITc/H/NHqN6aTdmEO38RCHKes1Hl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA5Yz1Ts4Fr2s/riqu4WiZN9l4d/bcDw7n6WYrqeaC7iQbBGJv
	yZ3w2ukNdL1FKLY7aLZ5Gr2250NsEzv/TXSBemFEx7wQFCI+WreE9ycTYegeuRYf30o=
X-Gm-Gg: ASbGncvDlT1HJH0qB3MGVN5jLFIMLxkvIGATG7RvDlZ8/ZULg3Zu1GyDoumeY8U8RxR
	UzUg3uy8U7j7dKymbAMSCG3fGB5MWBX5RRH8qNVmTMQeMG6uJWoBCB5Bs9rwrzZt2cOjeJ6nINC
	T8XzgUVNAreMUIzOT4gyHYzImxKw85EWechbYkt9dAWn0xpm5gQWYdEJEIar3BuRWdpGurs9rv3
	fliTkRPVuqG0NDtajKoa7o/Y+cUI/LgepBLRcXzzCN+k8EPUY32tPTZDK+k8YwUB5vTq3J3PPvF
	Du2zwIkRzyAPIH+JlM09j85SJsK5n1lzk0WHjRndVcT4eQa3aZslwzwpuRKEgmy+yoJXovTJvpc
	P10zCT7f1Zc5YJb7+/NZqgHuPxUw6NkzCitZFcAUP1sZcoj9H7vTcJ18QUnLOVoqLlj66/ttt
X-Google-Smtp-Source: AGHT+IGKCeR2r/LqTWZfnp4F6FPA5DKpq/WscvEqy8cVGEsQO6uQyLdM2X62ZFpf/CF88WVJpNKzJA==
X-Received: by 2002:a05:600c:608e:b0:471:672:3486 with SMTP id 5b1f17b1804b1-47717dff927mr33130885e9.15.1761664801353;
        Tue, 28 Oct 2025 08:20:01 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47718ffa42bsm21650985e9.4.2025.10.28.08.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:19:59 -0700 (PDT)
Date: Tue, 28 Oct 2025 17:19:58 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
Message-ID: <a4f3yhhz5sntno6gnfbjnjjsbtyo2e4y3da2aywsg36gvxkaxg@vw2vryukrepl>
References: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>

On 25-10-28 16:39:19, Abel Vesa wrote:
> In case of UCSI version 2.0 and above, if the orientation is set from
> glink as well, it will trigger the consumers along the graph (PHYs,
> repeaters and so on) to reconfigure a second time. This might break
> the consumer drivers which aren't currently implemented to drop the
> second request of setting the same orientation.
> 
> So lets leave the orientation setting to the UCSI generic implementation
> for all platform that implement UCSI spec 2.0 and above.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Ignore this one please, as it is incomplete.

We need to also set the orientation_aware in pmic_glink_ucsi_update_connector()
if the ucsi version is at least 2.0.

Will do and respin.

