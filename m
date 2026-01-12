Return-Path: <linux-usb+bounces-32174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 822F7D117A5
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 10:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 064B93085592
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 09:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAFF347BC3;
	Mon, 12 Jan 2026 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MwFuIlfI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52164320CB6
	for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209714; cv=none; b=dOzlvi61u28tRg7UYmq5fUbu0KY/wj3BUMMKyYAd8iC7OmjzkRkaDR2kJmyhtSP8im5g75RY+nMNEGktarfCeu37IR7HC3L+hVPlYhTqIRlz8AhDTmUr/UwfXJJUofYh67sJbaE4kvqNdwxMES9elMjMPEGmAtX4usZZmWH+tto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209714; c=relaxed/simple;
	bh=0dIJ35y1u4wC75UvXjU9dEt5QBNPKNsBUPSElh6oaXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=feK/+oLA+9OQihr7NbEzXf8qoDhP5c+TndMqsNtOvv2NEUfNN4jQl90nbQtH8NZjVcCXOklizymI4DopqptW9Xtj+JDrVH7vrdmwVNBz/ORksQsAGwG5KhzbEuyiABJ/9dM5UbPCmaFBLBKiCFZ0JidkOisCAXMFJy2wqrt23eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MwFuIlfI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbc3056afso3463945f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 01:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768209710; x=1768814510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AKi1GUUXLVsmpfPYMNd1sIrgONpjrMYrJbrbCSfih+E=;
        b=MwFuIlfIfsCqtLuTsjfVwztyb/L3ytMCH5eqsNGk2GifQWNgPStEwafaztnW82d6w+
         umVLQHkurqOLRDlG7TEQ3SYiJlTvVr9SqW+qGPh96GYPiXjg5iOVXmhtfIC/heA5pNdd
         5ryLx2gcBCUqxkJDOYOkftserR2SRFzxSdCIjqxhTP6PDu22Ows6zo14geVq9amA718T
         wXmseUkDq0tWsYTh8znOHp2KL7qhmyFrdW4vHYTENyQO5xIwDRZ+sBCnxl501aemE7Rn
         pjCId4JL4iZw9/+EJNAlrivdvBkh9xnOCoBGhTSZNfDJHHKMMl+gUvbC+4qtnSeR5y2B
         JmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209710; x=1768814510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKi1GUUXLVsmpfPYMNd1sIrgONpjrMYrJbrbCSfih+E=;
        b=WtaUwNAgYJRo8tYNA7Vcm2CKrCEkUG6MkIJdh6ohpYRXyrYGSJQPuaKKBWuINa1Bh6
         THoemfPPBSF/HqTQhcSrvezght2NHkbFMS1lwsfI56CJkGe6FhY5INbQOkN04KVNv9L/
         WHXd3dZ2wYUJNBZ+STKws5ZHoujTxc37Nz8ktD03BDp3AfOMJ4KiYFav4ZnZ0vVnn2O4
         mkQH+JfKnjoq/LP8mNNx3deVEFy9CtdZsOynF0O+3o54yMUKP5Jd75eHAR3NuG+ieqnl
         d8I4+HHOVDHr2cDOICH/zwUs8zuOsIceXE06XJha4piX5jzRWoGb358YDxgp3X2qQpfp
         74sA==
X-Forwarded-Encrypted: i=1; AJvYcCUU6P7hFTCpUcfu2MobrraiX4W6O6NURoct68CRIIUuAhQBZ2WJrIofJZ3s5bBEswVX8f+/Ny60OGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3xef0/5iFCI/WyaqmzdXR+lzsJdBHXq7op5lTN8O/rmwhA42
	sCCJIxXC8yFIBhHacK6VneyaPmLrbKqJO7GvVGCmyPO7XBciupd7a7lUy8BlU7nTg14=
X-Gm-Gg: AY/fxX7FmbKZ2vTXCDQyi30MF2bvm6HLtDDFrGYABMrIGzTbc8JRMCwLeUM+48yissP
	mBNdRVu9JhQBOxwaOIRg6C7ycAx6dwoC++NHhiJ7XMVPXIvtvNs5PH2bp81D3HfHtOAxvT81Ic5
	1hNUGu+McbAlySLEjoQ8G6IOaNYJzT6pyRnsx9M0sNFpuHkQu2fNJ0jqlfj2hqRlXRvo/mxDBqj
	FVsC458nbwo8SvKzO2GbQBMEp/Z7/YUvCiqmnoA3MtMn1K1qeGe7HKnqz3HloJQ0ltFeX6XFzwm
	cxZF+94qc8TpfkTogwO2jOqtEbY8GNGmR5lr57gUHK32pKKI6MB/by7oZQ1Z/AeepRAXCzMe9ov
	h6lybgUyiVAgltoiHdRds46QpqkcaG1kl1GyWKbRqNLlPm/aUBcUnbz4dMrV1OrmtKBeoppQSj7
	KSWo4wVQXGDv6Xl8iHY+ScxA6VIKsMkb3GyNLPkapit7q7tK9jP4b0Ed4=
X-Google-Smtp-Source: AGHT+IG2F6xTGx2xN+OUhcE2/musZFFTRmAzUU7EHgMP0/wo//84bXGjZbBeM191WFzmxdspyNwGug==
X-Received: by 2002:adf:ea46:0:b0:432:dfa8:e1b6 with SMTP id ffacd0b85a97d-432dfa8e228mr6639892f8f.39.1768209710521;
        Mon, 12 Jan 2026 01:21:50 -0800 (PST)
Received: from ?IPV6:2001:a61:1384:5201:596d:baf2:9af9:9ecc? ([2001:a61:1384:5201:596d:baf2:9af9:9ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm38167573f8f.43.2026.01.12.01.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 01:21:49 -0800 (PST)
Message-ID: <09934a68-48ec-4031-b42b-babdfea127d8@suse.com>
Date: Mon, 12 Jan 2026 10:21:49 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Trouble with drivers for Epson Moverio BT-40
To: natalie roentgen connolly <natalie@natalieee.net>,
 Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <9c4491aa-88d3-4c9a-843c-2f0d471263e0@natalieee.net>
 <ade89a9d-6034-43e6-ba74-778db2f8837c@suse.com>
 <ce3a8714-bce5-4cac-ba80-f3c64e6ff5e9@natalieee.net>
 <b0899011-78bb-4fdd-9e49-3dad6b11a9e6@suse.com>
 <d28d2b86-f016-431a-baa1-57cddc07ac94@natalieee.net>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <d28d2b86-f016-431a-baa1-57cddc07ac94@natalieee.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17.12.25 01:18, natalie roentgen connolly wrote:
> That patch seems to work perfectly. No errors were emitted from cdc-acm, and the following was printed to the kernel log as expected:
> cdc_acm 7-1.2:1.1: ttyACM0: USB ACM device

very nice to hear. Sorry for being late, Covid-19
is bad for regular maintenance work.
Do you want the fame resulting from me including you
in "Tested-by:" ?

	Regards
		Oliver


