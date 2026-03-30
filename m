Return-Path: <linux-usb+bounces-35660-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGCONPZiymn27gUAu9opvQ
	(envelope-from <linux-usb+bounces-35660-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 13:48:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF22835A83E
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 13:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 490C33031528
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19F03C8734;
	Mon, 30 Mar 2026 11:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zpg5ZZpj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD8F3C7E17
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870994; cv=none; b=FI51eFnkMxOSVbuX1HWusrwwfxnM9OChJkKlnnLlKbcMxcBJaANxzNuN+OYTFTwuDOxRrrXyo93CyGEtq/Nbb9q64++vKepHAZzrA0D1ZafUwTJVI+CZJGFouHqzGFUOpoxpbT51fg/AmZBVmFtBwWI6eeFLgMM9fLUAxMFF+oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870994; c=relaxed/simple;
	bh=jgwz6ODmjkcOQrIebh/RWM8fA2t14YiD4jTcc10ITRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WOBbR05kBcKir4RLCmdHDPN87jHaDSG+0cXchnNdtcrWthf29kbEsVfVliS6gM8IGveM2wCP2VgEHnFuHK5EU3vh4ioEAsxKWhLxf8AD70cmirrJKZ6jHQV1G4W8HbtY2wtwGppcOa24yNQTzlIPeWvH7aI9xZzK4Ii2da0WRIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Zpg5ZZpj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b41b545d9so4778410f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 04:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774870991; x=1775475791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7WhAEc966+DuA2BfT20ZzgZFHkE3/wK16Ytbs6g/G3Y=;
        b=Zpg5ZZpjfyN+ZhyWkzfM75ya8tR4K1FYrEGdg8blvMeNyoDwPf3f2xri+0JX4TLCo1
         vXBsiTRIzCL2ofasXyT8MEGkv+cFD7E45RRQ5D9PcySr3OOOwyv+j0poiaB5OVRk8ZbC
         XDoS3Xyd4bsJ7MYZhUZcDfAXE6rvKITUGflWpoiQ559sIzQaR9fqW7+uMHcGcPY2vDhK
         f7psG2kmpiWcS4b4sttYVOIA4kYT8TQ+bwsFvOF7pP94lz7PVhD9MmUFexuFA71YGrH2
         14FCnF5hyLLZPdpNUmV/o/IQThq5aEt7ILZ2gO+T3msvWszdLhDYdJwtqKVK8HlfD2EB
         lyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870991; x=1775475791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WhAEc966+DuA2BfT20ZzgZFHkE3/wK16Ytbs6g/G3Y=;
        b=BXUZ9HWcPdxTeCTmg8WDONae0U7md2/BX+rZUUCVduZ53/ctlqybf2kRyJfb+wR6cb
         S3/jta4eIA9BrQlT07AJ2SswG5WHCQ6H0yOL6dpJoXmsIk6yh8ArVP9jj8cW5t/rQAwk
         KKqsTYF64z+GaJCIyeEpFsf+VuGYhB92U16xXGYje5rxyqR5IVwn/v1Xuhbr7n5GqHCi
         n51UhpOrA2K6kucI3M16hx+NovFP8lQsZzvULSQL5iQL3yWgasc/s5Wt+jeRoq6WTt5Y
         LSuwJIV2V1HRPL69kfkRkUzZm+WbuSALm/tG3VezfGJWJ1+l5pdPO+q2IUi9qh8N5r/L
         vUdw==
X-Forwarded-Encrypted: i=1; AJvYcCXfzPpg3AJj9W7Xo6Z5+5064IGU4VWLHy0nhAMc7yAfr2GjQmBv2POoH8Qfyu4yvV3m2JbCqLPjaeM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5eTAvsbQnPoef5i8V6JmL9SRm7NXdZsZ7NxzzMr2Rz25Pu4vi
	9E43BWUfHHY0JNmib10zGl+v6mCfD37BwhJpOwsnrgBMkolLOVSMtV9xfhn65ilhkMs=
X-Gm-Gg: ATEYQzwCmpYg32ePuh85oag8+Rct7DVEJNXYchwsP29y0ceFh7G32LB2GgjcgX8W6i4
	3zlOiYG+Hculgq8XAFVDPIGWBBKV/Cgdyy5lUYJe2LCHzCARp65jyXj+spKFfOtuW99PJyLSE2b
	W116OR48R/9IhgxiNOw04ov8+A/GxLhViPfun7exZidflD3y2hl8+xgixigC1qfMnj9XbF7WJJ7
	acFllqD5gO3n0jsCYlrOYJcZL7zvBXJak+6FD9CdtW68j904m6o23HokHXZGYTfk9tvoXgAKkiZ
	Wgs5tppTaEMRh2IXTCMQpco9v7FKQp756bQIOW+klaaIOLPjbAJMW1xfZbaapJ0Yqu2kYlP/nF1
	+eMI6/6OyAbN6KjM94oHvLFwnBu75zcl5wayoRclvaKcvVSnWPen395tV8JqcsI/X6f4LhikvE5
	DltZC5oNqQSxSVibYlX7TdnFMGk3djCWnVghsW/+QtvgfuHV2IwznX7z1Mf9Rf8mfcvM7epwpPk
	F6g
X-Received: by 2002:a05:6000:184d:b0:437:711c:8754 with SMTP id ffacd0b85a97d-43b9e9da43fmr20502255f8f.7.1774870991475;
        Mon, 30 Mar 2026 04:43:11 -0700 (PDT)
Received: from ?IPV6:2001:a61:1373:4b01:cc61:7bc9:bea5:a415? ([2001:a61:1373:4b01:cc61:7bc9:bea5:a415])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20131568f8f.6.2026.03.30.04.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:43:11 -0700 (PDT)
Message-ID: <036cb81b-ae6e-4dcd-8f97-593e754279d1@suse.com>
Date: Mon, 30 Mar 2026 13:43:05 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hid: usbhid: fix deadlock in hid_post_reset()
To: Jiri Kosina <jikos@kernel.org>
Cc: bentiss@kernel.org, linux-input@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260324142507.74873-1-oneukum@suse.com>
 <8q66o2o4-7844-6p76-9964-7pr205p190pr@xreary.bet>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <8q66o2o4-7844-6p76-9964-7pr205p190pr@xreary.bet>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35660-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AF22835A83E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.26 11:34, Jiri Kosina wrote:
  
> Did you find this just by code inspection, or was this reported with a
> real device?

Pure inspection. We are looking at USB error handling
in general right now.

	Regards
		Oliver


