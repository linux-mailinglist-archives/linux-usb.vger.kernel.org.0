Return-Path: <linux-usb+bounces-3331-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 905157F9561
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 22:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09BCAB20A89
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 21:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6463B12E5A;
	Sun, 26 Nov 2023 21:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VF6vMpZR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDB1FB
	for <linux-usb@vger.kernel.org>; Sun, 26 Nov 2023 13:02:57 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6cb66fbc63dso2416602b3a.0
        for <linux-usb@vger.kernel.org>; Sun, 26 Nov 2023 13:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701032577; x=1701637377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KWOiuRBb3qWMj0z0bynYMJHcoo/v5rCyHeLqTf/DYk0=;
        b=VF6vMpZRHwXYm4RfE2ibv/lAg2Maz1XAB0PsVJ2zaWx3lBz0r/LQEgHLpF/cOfZAUz
         BsY2UaaUixXycISzPYdPrAp1ZbN8JN9BhSHmZKw2sLSm4+bf/qxtJjeWffXMHEoII7j8
         xAXPrx+zRN62V52UMza0xcLgEan9dUh4uE3CbnlGvSirdnpYdgAuuoLgptldqYjGKMJY
         nQFjqAF8yk1XyoSMw5/oVpSwpFHcgT/kk8vscQGGLktHNF09rEqAiTBZ5okRzQDAR9RC
         nlQTKkSbrHq8mbJexIOm/OGKA+kMj+D2GVgIwXwS+OlqRHnMgSsjW0WV3DyROD3y9K/L
         4lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701032577; x=1701637377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWOiuRBb3qWMj0z0bynYMJHcoo/v5rCyHeLqTf/DYk0=;
        b=C/HTUFCYt5jKp2m5R26/I3xwWlpKzuMv5i19ZrCQrStb0/krW2SQZmVaBGWtfXyCTm
         X+l9C0/Xf8Ncz1wH0B0CJN8WHkbINoPUEH0shMwiPjJm00BHwUi/yMAUgklzsbUiQ/51
         y58uQqQiMS6lZNg2E2tIyVp2q/GLTrD1aq6Nb9UbcpnshRAFvfIwdJJwlETdZocwPLgA
         j5pEivgt5MkX2qPTlYHfrgQiXZkZvsynZrGAgm26NKN9O6nz7zDoZnJ6S8MpUn3Q+Gl+
         pCOK7gOihyajJ3kqy5Qbr+5P0kwxldWL/7X69sCjM5WNPtJbS0tyaxX84+HlTAJS6B4/
         pwpg==
X-Gm-Message-State: AOJu0YxR4oEQfgBBe88Y57+tvNBhppCochFuTzLG+9uMawAjzzNZp9gC
	LooMZB5OKm7t7tf8xTFFs5PULL/114W9vA==
X-Google-Smtp-Source: AGHT+IGBr6IQzbQQCyPMs9SpqQ3wHOBB4zsfw8NIGbj0gFywlkRMOKjdeoi5h0oBSefB4nHdehVVWw==
X-Received: by 2002:a05:6a00:2e8b:b0:6cb:4361:773c with SMTP id fd11-20020a056a002e8b00b006cb4361773cmr12586148pfb.5.1701032576805;
        Sun, 26 Nov 2023 13:02:56 -0800 (PST)
Received: from [192.168.43.30] ([1.46.146.195])
        by smtp.googlemail.com with ESMTPSA id ey25-20020a056a0038d900b006c06804cd39sm5981198pfb.153.2023.11.26.13.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 13:02:56 -0800 (PST)
Message-ID: <27d60f61-77cf-46d5-9e60-8f60e8469008@gmail.com>
Date: Mon, 27 Nov 2023 04:02:52 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: device driver association
To: Ian Zurutuza <ian.zurutuza@gmail.com>, linux-usb@vger.kernel.org
References: <CAJrDFhpoOLNx-RX_raU4v++ZPYVShg_pmaxv0V2WfkfgcFdUGg@mail.gmail.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <CAJrDFhpoOLNx-RX_raU4v++ZPYVShg_pmaxv0V2WfkfgcFdUGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2023 13:38, Ian Zurutuza wrote:
> Hi,
> 
> I need help associating this device with the proper driver for serial
> communication. If I am barking up the wrong tree, please let me know.
> 
> I am able to open a serial port to send commands to the Epson BT-40
> moverio AR glasses after running this command `sudo modprobe -r
> cdc_acm && sudo modprobe usbserial vendor=0x04b8 product=0x0d12`.
> After I saw in the system log a message that asked me to reach out to
> this mailing list to get this device added to a proper driver. >

The proper driver is cdc-acm but your device has to be defined in the 
driver with the quirk NO_UNION_NORMAL due to the flawed Union descriptor 
in your device.

Lars

