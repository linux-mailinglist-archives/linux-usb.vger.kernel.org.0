Return-Path: <linux-usb+bounces-7531-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73392871847
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 09:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 075CE282448
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 08:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2845E4C634;
	Tue,  5 Mar 2024 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JcrZlHlb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828D8249F1
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709627720; cv=none; b=lgWujnH3YX6INxTXqly6CTY7/S+wfy7G0nPMYrVTays1fE6ZntKbSlX6wxyz7zOB+CWkQqSfvtsSk2pmQOk7DFncs17Ioa3k1nkxThdBzAyvmIUb42Q23YwLM+go6e2ba1N80cOSa11dPo7cR8EnsSKHLbgAmDaAh3AAXXwOCU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709627720; c=relaxed/simple;
	bh=82vsJjoVoWmADD8rvpl3Qp5VtIdC1v3LD9anMkdwnio=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ptH0ZqkmaS4kyyQ7bVKMQWeSJRvsDp7hVtZ2DSt037vdXvPactO/7E4IKfoPzVHMFz/c0DUXpjJGjyagpxGU4zvEziOS+P7j/yekq5SHu5h8ChE31zATMLSNwAigF2R6pdEw0BV3qIDJH3IHPa0rRHP8aShdVtdy/0NN3eOVUF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JcrZlHlb; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so1059942966b.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Mar 2024 00:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709627717; x=1710232517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PALRyszw+AlcpDZUROc9AgnCBJMpueCSeAJq71aQVJ8=;
        b=JcrZlHlbBLWyDeejHHJws4S/uQJyPjUy61ll/9bQ93TjkBCJ/6jF4U5dT9AcYauxME
         5Wim+A2q8J2yLP2vMzJTwuSuVNYZFdTz5UVvKpgsylGYZQL6oz11cQGrU7Af7EXwv/K7
         uXvkhFTmeD+hAXuhtB9An5KGdJPwhGq3d4dMXuGF9lh9cGdpndAy4YXkr7sRRV3CCqy6
         88Z6/hJZ0h0jucrdASJ/td4hyJKDDrLb+0EmdHNrcjHZqQqf1twvbTn5TyqNHrBja9/w
         bQMLyiSV4wFv+g+leHUvKyHGo5tfRYQ+Uoyn7zDKv87jVYwqxj0Yy5yzOggpHheek4Wi
         m3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709627717; x=1710232517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PALRyszw+AlcpDZUROc9AgnCBJMpueCSeAJq71aQVJ8=;
        b=w/TrssMCgZws5xvbDhPg1x4e97mzxcscNOs6l3Tf6tvVDXgcojB8YwT6i58BDN67Ux
         RGYn3U0VFLrWIFw3xKnURL6zsinDIJRpnBUk0EQZTrC9ARwkfUcnhx7uHIrZ6QhZ/oJW
         vRmbY/Xt0Dsf5ueGacignhNR6I9gYp6C+ddg5D1g5WziU/ewcLPyFpKdDOAMECHEl3Uw
         +qQeatP2FjqqgNH6zXBtbTttSS+PD15KR1xUROohfibqB2pPP6ae8o4gpc2irlJoMDGu
         ACZ+9PLyNNSEwW1SdXrjIqaUB5SiHu5obfTvNZrZFuKCBNPW6Lt1xMzUXAjzlDH1V2+j
         4TaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSjlrKX2N35ePkRbMoNxe9DSxqD1bIwv5J2/g7j0XsxUcouxUdOfZNKNCaCNO7ULqSoZZ2ByZUPaAN1KlW45I3MSsT4JqekCdN
X-Gm-Message-State: AOJu0Yy9vqj45b6L36Uo2JTPlFV+4yv+avSSxfTVxjgoinuOrK9SZDZc
	e4MCbNQUR1MIN+tzgbWyTyzKBqCNjOkB/Kh7Y0jOpl0+rwWGAL0jiYRJurQ9tjo=
X-Google-Smtp-Source: AGHT+IER8p93l0Uf/lQDwhGDEJk0Kqf+52LrfzFTfrA8CPi3Xno+ht4XI/iYhAltyL13LNun8owbZw==
X-Received: by 2002:a17:906:d287:b0:a3f:50f0:7a0a with SMTP id ay7-20020a170906d28700b00a3f50f07a0amr2054787ejb.20.1709627716925;
        Tue, 05 Mar 2024 00:35:16 -0800 (PST)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id s21-20020a170906355500b00a44dfaf84f4sm3524870eja.153.2024.03.05.00.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 00:35:16 -0800 (PST)
Message-ID: <a280d52a-c619-4e67-bda3-99e211b6d036@suse.com>
Date: Tue, 5 Mar 2024 09:35:15 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sr9800: Add check for usbnet_get_endpoints
To: Chen Ni <nichen@iscas.ac.cn>, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, justinstitt@google.com, andrew@lunn.ch,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240305075927.261284-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240305075927.261284-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.03.24 08:59, Chen Ni wrote:
> Add check for usbnet_get_endpoints() and return the error if it fails
> in order to transfer the error.

Hi,

thank you for the patch. The asix driver also fails
to check for that failure. Could you make a similar patch?

	Regards
		Oliver


