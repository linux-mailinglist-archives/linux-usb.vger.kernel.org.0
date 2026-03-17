Return-Path: <linux-usb+bounces-34939-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OtWOnBpuWkLEQIAu9opvQ
	(envelope-from <linux-usb+bounces-34939-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:47:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AD62AC438
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8292230D0FC6
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06013E715C;
	Tue, 17 Mar 2026 14:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MH9h2pPp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFCE3563F6
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758131; cv=none; b=fMUV5fi6aWiE/FmhweMOxwozUZL1fpl43T0EtPisS9V+DWLzSlc61uJ30z1QHcXE+sYrFBFp/2XBn2gZFlPLQ2kMa0ibgoY2VDtrJqhqC11rtE395/drUQ3fcqt217zvlw6G0sQwkWAuDlPZuCAwkaarNWBM9Elwce8xwWV9ELI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758131; c=relaxed/simple;
	bh=VcSxu7+Rt6pjbVzIfjpQ5S4/EHYXb1jK8VCuGDXYnXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4HHGmtIS0i0YV8EJgQB5HEsVfykH9x9Xxps2jMrQqywUmC3WNbeT0pJtZyGoZlaP9HTWs+3WgieUcYsao1iUjcG4ES5jcSKux6EJPseG2C2akNdMV8VxMLZbX8HtzleLu9G17uN1ZR82PqYHWuz5k3/WP65u2M0DcaHZjBwwPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MH9h2pPp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so10139475e9.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773758128; x=1774362928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Cwk0sufcQW5RoTCtoeXyYyIvZ59fFS2/mrNoD7ViYI=;
        b=MH9h2pPpOYUB+MNhiRorZ/kSJVTA/4li+JmIFIVVE4hMYPlycdOlZEKiw8qPMhZPPh
         39dckjk3pyeObUdQnWl6qU30duQYaMoCQ1TkMGAOuzzho9QxZVDa9ziXpLHNqk7pMglS
         TF0Nji6FOWJzOzTiebIixKwt7GzQCwzvzJmvC94nOKYg3HYX8GbwnIplZ61s/N7JPS6u
         3iPx5BK3xWPtnnzF7RbCSr+kFVVvkroRu2O3qeLXMvkNKQRttPQR+pat7fOpSV2N58Qd
         eE/E8h+ZZt+Vz4HU0z1RFQGjk3Agv2b0UYk5i1wqS5ErsaX0PUv4N8F5kK7a91rebVzI
         zyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758128; x=1774362928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Cwk0sufcQW5RoTCtoeXyYyIvZ59fFS2/mrNoD7ViYI=;
        b=nhGCoyZp2u91ZEmZuKRyl+zhWKdBnA0xhk7xKvmzYyOHQf40eipPZrjR1oxXieZYC/
         dlODhNh26fuR+CjoDPz1AP7gJrnc/+GSkHox5Y8ndFgIgjgU3NTvEqILowcX/sFrxXqQ
         Niim31uyPa8QTpPYPpDENIsfslxvg4YZGXr24BVxi3V22FqJWW89SgjeR2j4mOsWqj+l
         HwQ9iLTcTOLdD19bo7A7w5YyMumlo6E/LYGFhTcMyA2+i9uuQyaAuHvSWFl91nxfkh1t
         YmLFSean9+o77pkyGV2T2MGUrJBeVXvg2PMhLiQhgJfX8cxG/nY3dbDtLfZre4OPLlih
         U7MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQnYBUkcRedFU9Tz5zpAnKnK3ALPjmsZQePMrk+RVCgCsrHNvubwIdm3HcLpQ41Z6raifsfLwFrPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyoEtk6oSBVarkFI1b0QWudbMqEKLeyYv3Hg8APyTxf0/8r4/E
	Ainoet5Kh1rPuHFLn3Zxuqfy0jRkQG3qP/+ydDkESVpzenz0fBIBudYDXMHkseAufzk=
X-Gm-Gg: ATEYQzwTtpgjRM327qAriBQqVjF6iSGWkFjoTEemA+1Cunue6GfSwRdjA/Uhb9d3ROH
	QKM8yEhBSBT7ELOzgCb5KXmpG9CjI+cR55UYjNo1AQi7FzI93ju92lTMCMPh+fvj0Tqm3CQOOFH
	oMWTn4uK4ESW6YDwtAFigkEVh0qEg1X94n+dD7CSRkaScGi4R1c6WJxUTBfSnay5tzFZN3dlQeg
	j1Q3CmRfMf7UJmpf5hNEH4uvDPUjcjd9UtI5PDg8d9OYvJXrwdY/PPEEuKsyj6YZ9lbqSGM59+X
	SsmzHw64/MpKRrjPSvd9ZBRq2DXauJAssPaAy2V19ZLWPddxWNwdlKrWLcPUILEkUeCDBSj5JSi
	D1eel7Blmx6N/GETDHqHhGyTyNkTwIMufT4QmxTlWobRTTjdHeH0u/QMpMHPnsxRuvzuF5qH0+j
	cipxVWFe5nXNMEBtOIHSVIxIfVmyOuGurBCtQ6GLM9b6JSaYzkseL9u2VK734dJihMCKE=
X-Received: by 2002:a05:600c:4e8e:b0:485:34b3:8587 with SMTP id 5b1f17b1804b1-485566d7035mr274762245e9.10.1773758128320;
        Tue, 17 Mar 2026 07:35:28 -0700 (PDT)
Received: from ?IPV6:2001:a61:13ea:b101:88d5:cd46:69d7:10e4? ([2001:a61:13ea:b101:88d5:cd46:69d7:10e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a74266sm112003685e9.17.2026.03.17.07.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:35:27 -0700 (PDT)
Message-ID: <03344b43-b3aa-4800-b4dc-0b5a2b2fd5b4@suse.com>
Date: Tue, 17 Mar 2026 15:35:26 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATH v2] usb: usblp: add the reset_resume function interface
To: Alan Stern <stern@rowland.harvard.edu>, shitao <shitao@kylinos.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
References: <20260317125614.3215254-1-shitao@kylinos.cn>
 <c4f66c3b-7cb4-4bcc-868a-d3aef2d9e521@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <c4f66c3b-7cb4-4bcc-868a-d3aef2d9e521@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34939-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 85AD62AC438
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 17.03.26 15:06, Alan Stern wrote:
> On Tue, Mar 17, 2026 at 08:56:14PM +0800, shitao wrote:

>> 9. Result: kernel panic in pm_op() with use-after-free
>>
>> The bug manifests as:
>> Unable to handle kernel paging request at virtual address 006b6b6b6b6b6b93
>> pc : pm_op+0x50/0x80
>> Call trace:
>> pm_op+0x50/0x80
>> dpm_resume+0xdc/0x200
>> hibernation_snapshot+0x234/0x3d8
> 
> First, are you certain that setting the reset_resume callback equal to
> the resume callback is the right thing to do?  Don't printers hold some
> state information that will need to be restored after a reset?

Correct. This will not work.

However, if we take the trace seriously, it means that resume() was called
after disconnect(). That must never happen. Yet, if that happens the issue
is in the PM core, not USB.

	Regards
		Oliver

  


