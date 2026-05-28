Return-Path: <linux-usb+bounces-38130-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AcDC/cRGGrKbggAu9opvQ
	(envelope-from <linux-usb+bounces-38130-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 11:59:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E39F5F0153
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 11:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A30B430C7A2D
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 09:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF70B3B6377;
	Thu, 28 May 2026 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QFUzIx8p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EFF3B47D7
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962223; cv=none; b=NPCkcqPOypdDdMd4Yom45Z/I6YQ8PVCI/SLNmaGSauDstShePgZjRPwR6IYx7R2QVdlUy5z0EeUOawHLQmZnSp9UJQG3QWAX1VA64exO1k7Pn0cmbxD9B8OcuAVw4UF55fwd+PmvaC1C8TDkkZz9ovKQYUSs992HAadU6HCUwlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962223; c=relaxed/simple;
	bh=6iyY+VWpWK7RjeJO5ZIKek+NCJJXEjC6sQPd343u7OE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KrszKKlw2N0lS/muLJJExTY6ML4I59e7f9aORMMB/8gpWRuXuxFA3K8eSUzA7i1B74X4DQ7qi6ZZshai+ajRYd4ZJdXRTFxVtn/rWiGqrDlIxSVWwoLCTzBUILbgD18QmUQqza+M9VoSVo84LtGFCuWqHacQSLETFEqZAW/aCII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QFUzIx8p; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490426d72f7so59044415e9.3
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779962217; x=1780567017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UksBgfe71dRRTKPOD06jM/48YsZk+2Jj0c99vtBZapI=;
        b=QFUzIx8p5RfBo2tI0DU9sTeaPZeHFDKuiHGxOFbnqn6zZo3QWcwK7KHTN+a5iSYN1y
         cvi09NlxgqmxhPNqRmC4pMUFh/dcnW5hdtlL6aCOKbY0yn1AV9CO8DbLmAGzJmNSQBGN
         +CG+s5Kgw24RHfmckB30i7eodyM8I1UCkaEALgpn27/FsMuX3gcZ3JucjExPpkT71wVB
         0XEQew+CRNw+pSHLNHwzgM5V7/K4A8ZPujoPpz+0GPut0Ek2EpmJUiSzVg1lJlf3pdXj
         MFyL/s+A7WhGP91AzQd4jqOpybHepZL6z7IPlVebi1D5W90fR3DM8qit2+myxSVZXhxT
         bOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962217; x=1780567017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UksBgfe71dRRTKPOD06jM/48YsZk+2Jj0c99vtBZapI=;
        b=UAWd4In/qm3Kdyc96BJZHkOowU6Qi3NcbsfKP6/3Raj5V5OGSWjMEMAGhhmuoiXtna
         FdMEkA5Nu4B+0I8NhIU0pa8xdKQom8W2LmOB47DL0S+j7ykbv2OOo02uTEjhgshOhvHa
         tKQzgK8TRz0uxxc+QyRYcTMPfo8Cdyt21efbYtr+tfgmdQ2UTzo1AzcheK5Fjh9bVqbR
         9AM0g5mPNDjGp/3qIUeYW4Q3nZbLx3IykNcYjH6O9gCPqO3a2l8l13LGDg135uolvL+g
         Tl5RqpxQSF9c+EBMS/Q3NFd6RUPlIt0Eq46YijhssLhrgwES/XD+a3Lrvd6peo546RD0
         OHOA==
X-Gm-Message-State: AOJu0Yzbcmro9azToJIApMOaUTEquzNOpWZpr7j6u460OHsvzYrORsIx
	uysxWesBN6Ra/9ZCwDX/Z21PgXYCMy2XUpDoi0h8T4Bvyd0dNpn+i+G4HgSVjzgat+M=
X-Gm-Gg: Acq92OE4AsT025fAm2MwbkU88Wrgy2oA0L4vgTCYl8spLLvXVTpMfagcl0FzxziiLoA
	VkxR9xTlUAHIkx2fNS9X1vYH37y50W1CPRjdpGUHzQ53DfelPhjsmYyYJ4BvfAFLD4YvTHiPn/R
	KOzKvZeWhz7gUMavYuuGQt2HUnE91gsTR7iBiZtIDdb3t+HrjD6wsOu4e0hryaIAh8tasG+UWZh
	y8U5OjCo83l6lf2j3KYWu2rWA7W/WKz+co5UwyWXKpRDzb6uck/115cNX61wXrEvlUAOlWXhR9c
	uO0pm4FR46oC8/Xe/etZZWkhA454+pHMbMUXpxRJUE2V9wp7oZH7kaDiqP8lw/bMusjv/+KX8Rz
	jV8g2RCzmy7R0uLcTmYT+dEWP7yPw0nmuroPkBSm/YKQgOC0w+kRXJfmSkGijMMA/Mve6pwOxHB
	FRyGbinb59HXhZvgQZvcIB8rHkcZcGnC4pNKy3Q02RE7RzG62mhFQXqdpv+L4JpquVpTHVD6qXC
	wIATpwZsKBP1w==
X-Received: by 2002:a05:600c:1550:b0:490:48a0:b87a with SMTP id 5b1f17b1804b1-49048a0b90dmr417866725e9.9.1779962217425;
        Thu, 28 May 2026 02:56:57 -0700 (PDT)
Received: from ?IPV6:2001:a61:13de:8701:3ac2:500e:384:fbe1? ([2001:a61:13de:8701:3ac2:500e:384:fbe1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908ecb5238sm13644335e9.24.2026.05.28.02.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 02:56:56 -0700 (PDT)
Message-ID: <5099d6cc-c8bc-4fdc-97cf-31e96a57e0c1@suse.com>
Date: Thu, 28 May 2026 11:56:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: misc: yurex: fix ordering of usb_deregister_dev()
 and usb_set_intfdata()
To: Junzhe Li <ginger.jzllee@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528082751.204898-1-ginger.jzllee@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260528082751.204898-1-ginger.jzllee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38130-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 8E39F5F0153
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 28.05.26 10:27, Junzhe Li wrote:
> In yurex_disconnect(), usb_set_intfdata(interface, NULL) was called
> before usb_deregister_dev(interface, &yurex_class).
> This opens a race window with usb_open() in the USB core:
> 
>    T0 (yurex_disconnect)               T1 (usb_open)
>    --------------------------           -------------------------
>    usb_set_intfdata(iface, NULL) [t0]
>                                         fops = usb_minors[minor]  [t1]
>                                         /* fops still valid here */
>    usb_deregister_dev()
>      usb_minors[minor] = NULL   [t2]
>                                         file->f_op->open(inode, file)
>                                           yurex_open()
>                                             dev = usb_get_intfdata() [t3]
>                                             /* dev is NULL! */

Yes, but yurex_open() checks for dev == NULL
Could you please elaborate?

	Regards
		Oliver


