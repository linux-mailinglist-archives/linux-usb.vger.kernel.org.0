Return-Path: <linux-usb+bounces-9267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8914A8A1721
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 16:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6217281BAC
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 14:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F9414F128;
	Thu, 11 Apr 2024 14:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="djIbvibv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88C414F103
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 14:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712845651; cv=none; b=Ve/PnVDlIFoZnDEXeF1wYlDCPRPt5QT++nx0kHMoSX/rJBG6it937X+T9/AjHEJdJWcAguGOdiXV2pQM2EGB+mhHrh2C8BqfEwizEwHNF1/1alEGuUDvKYyezvWKYPtnMACjLIpuanF1cky0bMD/Gtpp2eW6TsIlOjhvy53ZbQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712845651; c=relaxed/simple;
	bh=7SnslGUWPGiRrtugkuJstyDRVVGJEJGLeQCkmLXs+/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yt/FcV+Ofj6/+tLW1eYktagQZjYa/mTo9PH5y5cq3RMD/P1YXp5YvPjW++UfM3t9s4eTtw+hZyKvNXG4aFlHoiVzAr+GPtXXzJIcG77Z42+NJSH0UtDrCjKTYp7i670ysEZEEN12SGse7HTfB+18/FCeK2jmSiMpyCxh1cIjWAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=djIbvibv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-417d42dd5a4so5231095e9.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 07:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712845647; x=1713450447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rkEbmA6F130v+4m3HDCO7eqBS624jAKjQM4UyvdRGso=;
        b=djIbvibv3kizCN2dpoTh3jxfss+UmjVvjlDivEXzXIES4uU9s5ujc9JbcNJIziCY+8
         zGwLn0PoucXIJ203VZek4zNkZ1yX7PkjMyj+DfAfbJPE1sYVY66Er5huYFRd1zma4NJ2
         fzZZLasrN8nDWPplndlfIqt4xyVV37NWQ7bPhEhjSqrWrNAwrABA1ofJQMBdi0Fk2vFs
         ztT2vO/ygKgYRgQYP3Gstu6j35jJS9n0vI0BeG5gxIK8mCKW4oU4RnHfb9t+kLYTTwUp
         yP0qeBY9JLNv5uXEt5+M/kZKNhh1TxVRIsNyWVpsAQI3ewJcLbG9/EWepXnFbGGia+5i
         B8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712845647; x=1713450447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkEbmA6F130v+4m3HDCO7eqBS624jAKjQM4UyvdRGso=;
        b=Y7Xuk3i0bE1GsjnRLJK/WTGxhYiSz1bfZusKa8vXue9FmCPNBc+vjWBNNMB5JQIT9V
         DJ/t3O2iZZu56KjdXxRSBttdvViRjvtcZE7kEDdtbQJOrNhgXrk/jdRV6qbvTcPA+Rc6
         upgIxgkiXcXrt1ZRHLZbFgZ28WrrzCWwPDvFFxioS6IDAL88WNj4S2e4KtljeM+AYk+J
         k6WNfNM7kWZohPykGtYjuMhXHNghMeg2HlaakgMCri/Y365uDJDrVk0dBoSUOwapAkQ2
         dR/IzE/70V7l3aTkQY7OPKbwBHrHPDAOvhbB+LEv3fz/HfFs46rJbYmCThGr34oBX2Qc
         YD6g==
X-Gm-Message-State: AOJu0YwFr/lNNJY7QY7srI4Mqpk6vy5yf5hskpYgH37C+b0BvuIBsb/w
	BSb/mkcND0Xj0Tj2tvVR92Pw8cwggTn3R0TjuawKYDFIDIhnE4lsPUBtYLrxVH0=
X-Google-Smtp-Source: AGHT+IF+P3f8VM1hFwymxo/VGyB/AtHZrxsIvFDUVI4211xXC/EXHdpjpy5vTxJ/0kyCT9o+oE3AGA==
X-Received: by 2002:a05:600c:3b93:b0:416:b5e6:d31e with SMTP id n19-20020a05600c3b9300b00416b5e6d31emr4862162wms.4.1712845647315;
        Thu, 11 Apr 2024 07:27:27 -0700 (PDT)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id fk7-20020a05600c0cc700b00417c434a340sm2489437wmb.21.2024.04.11.07.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 07:27:27 -0700 (PDT)
Message-ID: <4c761c2f-76b7-490e-ad1c-ecf1376aab74@suse.com>
Date: Thu, 11 Apr 2024 16:27:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/6] usb: usb_parse_endpoint ignore reserved bits
To: Greg KH <greg@kroah.com>, Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
References: <20240411124722.17343-1-oneukum@suse.com>
 <20240411124722.17343-2-oneukum@suse.com>
 <2024041115-aging-mankind-e69e@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2024041115-aging-mankind-e69e@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.04.24 16:11, Greg KH wrote:
> On Thu, Apr 11, 2024 at 02:42:59PM +0200, Oliver Neukum wrote:
>> We have to ignore the higher bits in bEndpointAddress
> 
> Why?

Because if we do not, we are breaking compatibility with all future
standards that use those bits in backwards compatible manner.

	Regards
		Oliver

