Return-Path: <linux-usb+bounces-1915-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B20287CF571
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6933028217B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3842818B16;
	Thu, 19 Oct 2023 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgXCyMoJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3357A19449
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:34:56 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C593C123
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:34:54 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-313e742a787so363022f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697711693; x=1698316493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHZ0E2oURQ40dzVmSqirtuqVQjv7KJZAugs/PKtmYUc=;
        b=lgXCyMoJ4ePOJCrJQlFBVWwImk9CquZTm2u+4IE5bTLtPVWBbowhiIBfGgaGuAWrir
         DMxI0HL07KlU1xMB4vomLRQKtQMZLphduJzxLtj2ykGYudNotYgAQqSoAnDKKRUT/gNI
         SgcdgfC3VbnIluEfSaA7d/2WV73XdsUSrMjHLFjNMAYh3QJzTsG1AT6xJbt8D20l7NEg
         7O4YkfxJpbWGEE08hp+aAS6en1I9e6rsXaJTKTeKxVBWPWTorAwlBUeRSrJWXpo4LLsx
         HsrmepXs085cNJX7L5ZVKAFsHgngCK3ga37IxqX4hyu9uwhOPvk86n+uWaDncEpLjTZd
         usQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697711693; x=1698316493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHZ0E2oURQ40dzVmSqirtuqVQjv7KJZAugs/PKtmYUc=;
        b=VbyQBEpTno6w1udshGgGj3CDXoPtZDMy3RjjOZsZP51TtUh7Ki+ZCY37XMzzA4y7YQ
         lKV0d5nw4RatK7FJFlR0W2ZR2MNvNEgFNqzwJMgmgrlTr14w7iQhB3wbXjRps6Dv4ws0
         SMJgFhcpfF47ZfH5J5FCUoqemQzSdc7hdlwFagmMJa1+eido3jeUvQQOdPXvSmovcMVB
         AAciKa7nFEtbrlKLGJCnMVzRjSw/maMcqd2zK0DLOQQg9wlzhqxtSZmLjyCqFUewtEYj
         AVlcFitsukuZTJCoQ18vzuzS+kZSxVs8wOwudQKletE3bOzV6hU0IKIe7vUPc1dkuyWp
         Lj2w==
X-Gm-Message-State: AOJu0Yy6k/6Dl6rj2iZcQjLqbmj71foNjmmDL0igTVJrIoZKPhbiHdrY
	HxMozy5TLcYRkWEcEvYMIWI0LA==
X-Google-Smtp-Source: AGHT+IFdar0VVDaMOSgRpl4MSClkYLbAVPKlMoGU4cE/swmAe891KuxkdeV5d/6VMA1irMhQ27GKxQ==
X-Received: by 2002:adf:eb87:0:b0:32d:dd68:e83 with SMTP id t7-20020adfeb87000000b0032ddd680e83mr1075240wrn.21.1697711693227;
        Thu, 19 Oct 2023 03:34:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q9-20020a05600000c900b0032d8eecf901sm4175868wrx.3.2023.10.19.03.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:34:52 -0700 (PDT)
Date: Thu, 19 Oct 2023 13:34:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
	trix@redhat.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] net: lan78xx: add an error code check in
 lan78xx_write_raw_eeprom
Message-ID: <aa78dff4-d572-4abc-9f86-3c01f887faf1@kadam.mountain>
References: <20231019084022.1528885-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019084022.1528885-1-suhui@nfschina.com>

On Thu, Oct 19, 2023 at 04:40:23PM +0800, Su Hui wrote:
> check the value of 'ret' after call 'lan78xx_read_reg'.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> 
> Clang complains that value stored to 'ret' is never read.
> Maybe this place miss an error code check, I'm not sure 
> about this.

There are a bunch more "ret = " assignments which aren't used in this
function.

regards,
dan carpenter


