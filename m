Return-Path: <linux-usb+bounces-30529-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0BC60518
	for <lists+linux-usb@lfdr.de>; Sat, 15 Nov 2025 13:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EEB43BA9D8
	for <lists+linux-usb@lfdr.de>; Sat, 15 Nov 2025 12:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D4A283FF0;
	Sat, 15 Nov 2025 12:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Aw9az22K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7041388
	for <linux-usb@vger.kernel.org>; Sat, 15 Nov 2025 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763210040; cv=none; b=U55Y04WbQSZznPKsqwM0t0lbF/uaSizhij2dD6zYVcFqrtayvZhlbcBka/ITdID/xFTx39Ov/ul9SXRpJ9dlCy0nkMBNgi4znBUGYuE9yR+Kq8kqMEK+BmF6h63g1vOGBL7NSa1Qg62K1yNn6LSBFl18wKDGIB2dU8D780coyQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763210040; c=relaxed/simple;
	bh=ZRDa7X2qOhicNkRilum7iyXjYeDr0de0UFoOarn43C4=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=NtxqVgRmzaXV4RnPXqUg0H+3pNLFC/ZwA5Mvu+tZOfXcJuOtB96CIAP/nPqzJxkVnx8d3h1xkVFxfH/RLzbl1bcpVKq/OypcIxJvGDAuVVg4FToy1h6gTKhqZj2tQqc1GU3H9GQwPPQOoztxWffxTCVpDShfpJqm49R6L2Sl5Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Aw9az22K; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b38693c4dso1302338f8f.3
        for <linux-usb@vger.kernel.org>; Sat, 15 Nov 2025 04:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763210036; x=1763814836; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtqnf19rAxKhCMnKuxFk3VQ746Xnyg0osYpHgquPOsc=;
        b=Aw9az22KkHe7C9tQxGS4SOET8ahdp9wxEWBgTx0JdXC1ZmJP+MCWkC10NdqxyJkYaT
         o1F1d4cqCpP6q0LEgBBb6kuhzpB1t4QwlhvVRAnB+qAkBDeWPwm7Iruu1a0rn33OJUNN
         LxzbTvrfX8ulm76Vdyi3/RQH1fCmZxaHiAS/y7U7ukCLe4AX7iirW44FUfC8MMJ1/jOI
         qGPaAm8/VjXzaM3Nx4Nf1nzm7Essl/1DU6OLT6T6osbvbqxvV421rExJ5Jax/HRonruh
         BRVw4OWxmzvBov3WjSvk+EA+BIulxyMa2+9zoIxY3g7niZBeu91dohhCO8GVAt0Au53f
         Wx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763210036; x=1763814836;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtqnf19rAxKhCMnKuxFk3VQ746Xnyg0osYpHgquPOsc=;
        b=JwYTGd3I+g8aiWXhhcsTzyiYCZ2QqR1XqpKwfNFOhVFXm296GrYN3Vl5l8uI/xsHpf
         /lckd2AOw/kitdm3ognKTQxr7Uu8iB2fFca7TJS3yY/6cuQSztJPCYnNq7ba8bNoapdC
         y0l7Bpyz8bn5vghMGfZUz6gTjtDC6anEWqnRtgDI2Zx7Pe8jDOvILnxlvjpoms9bwIWN
         piZmYB7bCazJcjmLlviJ+2QtvhyRY50pSIo2Uo+ngxOmqGy5lwpDUTaHSJgLlOr4fMzs
         2qijUjtfqZE+f4QdRmBmsldAhgl0uloR69/Pq9oXmEMuxzcS2dKZYD+562nQRak08mvw
         xMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuzC0rxigJZ2I6PRaY6CUXpGVUQhiK8F7lL9c+uRmmcEA0NeH0l101TCJ2O9ZenXPH5psa+ujlMkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5O+EpQqwoYPB/JB5q0qcXMyXn6WMMJGUXDNfTxs3ssSEZtiCD
	ttzf3vnInd9DGXKR+hRYVtE5zzvzyiny3bztXg4pSOw+PhugPTNy58+/1Afs6pekTRM=
X-Gm-Gg: ASbGncvPmeD5ggsFKpkjqm92YiRPIB+6eDnP5rpojUSoBt8R8kt8Cqd5IiFtTnVjJAP
	FLQ+nQUCH1W4f+oxT0emEHrN03YDuU5sKDTG+Lt18icbXlZyHNJyPoMn+y0l/hExZ+deC0+vRZV
	FsicWP8NnHv0UA5NJk0n+6KG2LugcPB1rV8ENTbu4UKLiNnB6i5X7tt4O/Eb8x1WmYQhFinH0XF
	lhURLr9xI6PR4ycixSsEWMnpVLLQ9pAlLbMxt8U438IBfiRNWRYB5c2lvN2+wUlTJNpsDMWpYCG
	GobfJ9zH0r5F7i26ZP/9QFBRICoORrlyrlDc6crOtnzy2fyvVpP0WyPW3ZeFKMcRJEVD9uy9mTb
	S8lW/ctHnHGqT2r5vgqNtv2SyAPdwj5LpVLphNg6AVnFqPTSKte+zGkYxgVcChpZPJlbS/3Ur2P
	UfvyA6ialmGA6mNEDwocFyyytiPQg00/wg2k3aM/9TGz2v7FQj/JK5iw==
X-Google-Smtp-Source: AGHT+IH68hNngwZhYpd9vquoCIPlgcJ1vPhNd3/4WnrvDBsF+8EDaoeM+ZvmKTzsA5mzG3phFO2Aaw==
X-Received: by 2002:a5d:64e3:0:b0:42b:3878:beb7 with SMTP id ffacd0b85a97d-42b5939896amr6087952f8f.43.1763210036197;
        Sat, 15 Nov 2025 04:33:56 -0800 (PST)
Received: from ?IPV6:2001:a61:134c:8401:9dee:c6d3:2820:beac? ([2001:a61:134c:8401:9dee:c6d3:2820:beac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85e6fsm16011805f8f.18.2025.11.15.04.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Nov 2025 04:33:55 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------nHX7CPgwLi0J9jNmBXoWSU3W"
Message-ID: <701e5678-a992-45be-9be3-df68dfe14705@suse.com>
Date: Sat, 15 Nov 2025 13:33:48 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cdc_ncm doesn't detect link unless ethtool is run (ASIX AX88179B)
To: WGH <da-wgh@ya.ru>, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1c3f0582-4c92-41b3-a3db-5158661d4e1a@ya.ru>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <1c3f0582-4c92-41b3-a3db-5158661d4e1a@ya.ru>

This is a multi-part message in MIME format.
--------------nHX7CPgwLi0J9jNmBXoWSU3W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.11.25 09:58, WGH wrote:
> Hello.
> 
> I'm running Linux 6.17.7, and recently obtained a UGREEN 6 in 1 hub containing an AX88179B chip.
> 
> By default, it uses the generic cdc_ncm driver, and it works mostly okay.
> 
> The annoying problem I have is that most of the time the kernel doesn't notice that the link is up. ip link reports NO-CARRIER, network management daemon doesn't configure the interface, and so on.

Hi,

that strongly points to a race condition.
Could you try the attached diagnostic patch?

	Regards
		Oliver

--------------nHX7CPgwLi0J9jNmBXoWSU3W
Content-Type: text/x-patch; charset=UTF-8; name="ncm_bind_uncond.patch"
Content-Disposition: attachment; filename="ncm_bind_uncond.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3VzYi91c2JuZXQuYyBiL2RyaXZlcnMvbmV0L3Vz
Yi91c2JuZXQuYwppbmRleCAxZDlmYWE3MGJhM2IuLmQwNDJiYTU3NDIxNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9uZXQvdXNiL3VzYm5ldC5jCisrKyBiL2RyaXZlcnMvbmV0L3VzYi91c2Ju
ZXQuYwpAQCAtMTg5Miw3ICsxODkyLDcgQEAgdXNibmV0X3Byb2JlKHN0cnVjdCB1c2JfaW50
ZXJmYWNlICp1ZGV2LCBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCAqcHJvZCkKIAogCW5l
dGlmX2RldmljZV9hdHRhY2gobmV0KTsKIAotCWlmIChkZXYtPmRyaXZlcl9pbmZvLT5mbGFn
cyAmIEZMQUdfTElOS19JTlRSKQorCS8vaWYgKGRldi0+ZHJpdmVyX2luZm8tPmZsYWdzICYg
RkxBR19MSU5LX0lOVFIpCiAJCXVzYm5ldF9saW5rX2NoYW5nZShkZXYsIDAsIDApOwogCiAJ
cmV0dXJuIDA7Cg==

--------------nHX7CPgwLi0J9jNmBXoWSU3W--

