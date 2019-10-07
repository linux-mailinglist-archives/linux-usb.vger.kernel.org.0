Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D24FFCE78F
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 17:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbfJGPbo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 11:31:44 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42022 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727931AbfJGPbo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 11:31:44 -0400
Received: by mail-pf1-f193.google.com with SMTP id q12so8873394pff.9
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2019 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=JZ4ZLhpG0uBtRMl0o3Xeh7toOVYQ8X7X8agStl6yaPA=;
        b=PWxzNCilhqxZx4BInRaEC85RoByjMuhy/v7d51XUHuyPoc2xgtUFa2Dq4rtT/tSg8K
         o/mw7qx2clFS1oYj3pq6+B+546SBKXzyKa8K6+VRpc1eX8uFXe37ryhWGl9v8/Dfcfj3
         HYvUYe7reb+I0oCOS67lxnxPmyia1T24TyWaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=JZ4ZLhpG0uBtRMl0o3Xeh7toOVYQ8X7X8agStl6yaPA=;
        b=kKSp088HAIRsWNYECqv3R8RYlu/9w79Hr+dZz2rogWKG3JWui+lGc1cUbyHlMc+Htu
         FS0PoKAHj8LrROPiW3lZjNaXzUb5tnh5aPBEeAxhkTYjNS3E8ap6xYlYFKGN3EUxZMm+
         rh5YCDz1Yt4uKPmJoYgVXHzL18fGVLy5uLjsntV6fSPom0n9v3E882s6yPzHZqXtUgN/
         xUp8R8S1OjX1BymS6ffPExX0ISdyLRwDNXefiqoJIgMn9mWXl+/vC3yJexnQcWcA1rD3
         ju1ib4wDa5DG/7CloGX8vzo6MooDDf+41P6k+RnsN2zaQ3u2GwiLgzjOuyTRq4+CFoSD
         +ESw==
X-Gm-Message-State: APjAAAXLdJYGp4w7gjgVkVnF+t7gAGMC8l1907+m70l1GIeto3z8yz9I
        SoDwlsVoEgLlUbkSLG8TSBjX3A==
X-Google-Smtp-Source: APXvYqwxYFF7RQHdC7kZifXplqwZ98J3wRnNwaPRlto+tGJlCXia8cgagHkZUM044+QuC2S+qil0Wg==
X-Received: by 2002:a17:90a:a10f:: with SMTP id s15mr7702950pjp.49.1570462303498;
        Mon, 07 Oct 2019 08:31:43 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b14sm16028527pfi.95.2019.10.07.08.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 08:31:43 -0700 (PDT)
Message-ID: <5d9b5a5f.1c69fb81.842f8.329e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191005210449.3926-4-hdegoede@redhat.com>
References: <20191005210449.3926-1-hdegoede@redhat.com> <20191005210449.3926-4-hdegoede@redhat.com>
From:   Stephen Boyd <swboyd@chromium.org>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: dwc3: Remove dev_err() on platform_get_irq() failure
User-Agent: alot/0.8.1
Date:   Mon, 07 Oct 2019 08:31:42 -0700
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Hans de Goede (2019-10-05 14:04:49)
> Since commit 7723f4c5ecdb ("driver core: platform: Add an error message to
> platform_get_irq*()"), platform_get_irq() will call dev_err() itself on
> failure, so there is no need for the driver to also do this.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

