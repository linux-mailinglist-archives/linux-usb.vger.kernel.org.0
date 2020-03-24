Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4F4C1912A5
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 15:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727731AbgCXOR5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 10:17:57 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41597 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbgCXOR5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 10:17:57 -0400
Received: by mail-ed1-f68.google.com with SMTP id v1so6733550edq.8;
        Tue, 24 Mar 2020 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xx2u6dAeKaaJIcCdGG7a+MHyPFXyawY2CxF2KYjyqZQ=;
        b=Pfi3U3Ir4fQy1Yx260wRphweTsnWzdkKnJG94vRjiuMBLX4MwnIELs2kjki8abS+e9
         P1mDGBUW8ebLtZWZy8wZ722Cr2ghTK3WhEoE/1L+6ZW8E4iaIcjjv8hcyuh1UtVt8BpM
         bHx2dhHaSFLlOQHEa3RBTyXULDsxsK4CLfJYbmiHSjj/1edLkjkOCpRFAUg2fh6ezT/F
         f+w7jTZPtdmPzj68h01NTo22/gSsbrYHAvWRzcOB+WqfJV0XuuRPJAob48hy0O4axb/t
         3Yk+1QbeLzM7cFUm589nmKPecsboesnHlC+mDNMCOeZKN5yRM+edDvUlY8Vi8H09c2Oo
         9HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xx2u6dAeKaaJIcCdGG7a+MHyPFXyawY2CxF2KYjyqZQ=;
        b=f34uLe0vL+qz+PA/o/LLEIYUG8xC3LageAJRg85gkid+iHjx5bBgnD/mbB42gR0wot
         IjPjt2+Oa7ZH4pRpEqYe6q9Xy8wRbUgVeTLEA6LXWgYsYH4W1TDmikFmJZvVNub9a8cr
         WuvIqCZDUYBh5UhF/M9ttTsEhT/AcenzdZn1bCSAbEvdNrEA6pZzmXiBKPPJNtLmZp/7
         dN6XsrOkI5L2feaPJKzA9nsr4RGYor5LEUvhLt3J5A0UcXUzY8yFwoQ5lQh4PDg6Luuc
         GCnIALGjlEMEMmDZ9eOflvSLViFLVdel+g550HQWNXbyWFiq85no3CnEi6YvMZNrj8/C
         uYmA==
X-Gm-Message-State: ANhLgQ1vDtnHpjujTdnXJPlv+OZLKfjdssSrzHWrmYEUf+0SFruDkXLn
        im+zZ+g//a3Gpijv8Mwe0uU53bwJxU9AqOy33no=
X-Google-Smtp-Source: ADFU+vvZgU97KBWThgXsmPEOlxqBfDic4xAuO4yKuCu8eS8LLOFWGOi+tSJBGkNesAYEEyX2igkt8q2rwd+Rdcoco7c=
X-Received: by 2002:aa7:c910:: with SMTP id b16mr7482653edt.13.1585059474879;
 Tue, 24 Mar 2020 07:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200324102030.31000-1-narmstrong@baylibre.com> <20200324102030.31000-4-narmstrong@baylibre.com>
In-Reply-To: <20200324102030.31000-4-narmstrong@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 24 Mar 2020 15:17:44 +0100
Message-ID: <CAFBinCA53iP3n849JacHjvSJCLxJEwikAspL-MUDJsZi7kWC5g@mail.gmail.com>
Subject: Re: [PATCH 03/13] usb: dwc3: meson-g12a: handle the phy and glue
 registers separately
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 24, 2020 at 11:20 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On the Amlogic GXL/GXM SoCs, only the USB control registers are available,
> the PHY mode being handled in the PHY registers.
>
> Thus, handle the PHY mode registers in separate regmaps and prepare
> support for Amlogic GXL/GXM SoCs by moving the regmap setup in a callback
> set in the SoC match data.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
