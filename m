Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 661775FF28B
	for <lists+linux-usb@lfdr.de>; Fri, 14 Oct 2022 18:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbiJNQud (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Oct 2022 12:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiJNQu1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Oct 2022 12:50:27 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4FD5245E
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 09:50:22 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id i3so5404929pfk.9
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 09:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXs8pGXtGGZWzXsw4rZ+LS2EAkzqKLgAwtWpxGx92fU=;
        b=fttFUz+vxtraLRPbXbj3FKm0IZ9ARAZnSS6vv/CpioswqaUGc2WlbiSpyUSk+1nU1/
         luOh02QiD1Iflia0SkTTTUXHBeGh1ks5OEB9XPvZ2wZn5L7n1NVPCHbWcJho/5YCCojE
         VdYKJgr0K5MJom5sx6sIUr18wcSJLP/VyQfP+ywSQD0C2sQuYSX+vPUK57XQ+jIm33hy
         R9jNjgVzXuNGjF+KDbV2u2Re3Xn2Q2NcvBirDKBfqGmsN/AVwNIusT0ugCg7Ck16LrGX
         n+4oSwQDJY+tbTLLExEj8WsBpPeejE1IG6rMbaZQuwoWvPFkA7XDNt47FDOAEMyv62X6
         6QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXs8pGXtGGZWzXsw4rZ+LS2EAkzqKLgAwtWpxGx92fU=;
        b=x1mZHZakq6X8aakwtky+WUHT6dMoJToeIPLu2mdrCpRj2lqixonH9AKWyFk4pmBY2P
         GY15raJ5HxSYVQKCUjQtJ7xKAcFpJesuUd4vR/dvbShCBdRmMbhGMtgyPJm4BdKKicaW
         jKac5AULm7IpkdBxsSXlAlrEjw+rl+mCzjf+WVCfCGionV0PJ3R/iFDpQRFu6vumf5cw
         I+WWuhmqBzije6gzIH3Ca51jsvnVOP8ziJXB34XR5KR6Z/DDK0NNaDGupGUHT/P6U4xl
         yGO3vdCQWPJZKsGAEfOsR/t/bu9ItVS55jDU45HR3copE3LSKcPzngPSyem24JseFk1Y
         zYpQ==
X-Gm-Message-State: ACrzQf3iX42jjS9mrwtKr5w5/BZBANWGTU8uFIVbkFMQIASy/phRuhxt
        guolfhxJ0ET26LH0uhEAGgaOWA==
X-Google-Smtp-Source: AMsMyM5S9FfuTscYk1rWNAgrhHrGOzoBMP/C/g49+m/RbzrY6zhImlSUl23Oz0HPujc59lXNjdSqzQ==
X-Received: by 2002:aa7:8895:0:b0:565:e8b7:8494 with SMTP id z21-20020aa78895000000b00565e8b78494mr6131922pfe.82.1665766222208;
        Fri, 14 Oct 2022 09:50:22 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id k24-20020a170902761800b001782aab6318sm1969958pll.68.2022.10.14.09.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 09:50:21 -0700 (PDT)
Date:   Fri, 14 Oct 2022 09:50:21 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Oct 2022 09:50:27 PDT (-0700)
Subject:     Re: [PATCH] MAINTAINERS: git://github -> https://github.com for petkan
In-Reply-To: <166573561445.14465.3335360255597249102.git-patchwork-notify@kernel.org>
CC:     petkan@nucleusys.com, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     patchwork-bot+netdevbpf@kernel.org
Message-ID: <mhng-f9587376-2d54-4ff5-ae71-0992b080ff1a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 14 Oct 2022 01:20:14 PDT (-0700), patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
>
> This patch was applied to netdev/net.git (master)
> by David S. Miller <davem@davemloft.net>:
>
> On Thu, 13 Oct 2022 14:46:36 -0700 you wrote:
>> Github deprecated the git:// links about a year ago, so let's move to
>> the https:// URLs instead.
>>
>> Reported-by: Conor Dooley <conor.dooley@microchip.com>
>> Link: https://github.blog/2021-09-01-improving-git-protocol-security-github/
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> [...]
>
> Here is the summary with links:
>   - MAINTAINERS: git://github -> https://github.com for petkan
>     https://git.kernel.org/netdev/net/c/9a9a5d80ec98
>
> You are awesome, thank you!

I made a typo in the subject: "git://github -> https://github.com" 
doesn't match.  No big deal, but I figured I'd point it out.
