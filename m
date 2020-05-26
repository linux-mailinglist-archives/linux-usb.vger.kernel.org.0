Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66C81AE547
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2020 20:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbgDQS5D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Apr 2020 14:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726432AbgDQS5D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Apr 2020 14:57:03 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04DDFC061A0C;
        Fri, 17 Apr 2020 11:57:02 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id x1so2318515ejd.8;
        Fri, 17 Apr 2020 11:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+2CABe3J87oGmGpGl7GwWQxi2qTyg12kyqBFsNfaKsE=;
        b=LH7a15W7hJM2SMiwrvKUtxmpOmy5YZ8zKeTytb3wlCIWmdcsBsacigCzJOC50Y3R2X
         wZxyzg6tBnruIJvdlkxMBP24IsBy7vRnEs6tcFsI0MjiENUQpk6Hr1ufNCdeUMI4CHJ2
         dKKH1+J1HjX/VURqfWfTUXmlvvQHgxhCXF4gjYAY4Iidu9sRZPFs1kslw/Lvfp7vsIFo
         ZS5YQDztSa8osx/j0GI340HqZ89y5ympFULCZlVSB0azc8wUhyPAlv5KrtFI8seJ7B3f
         UOLmDiSCTUl+9WCLuV2l6MG5WzmG8Y1AcuyX3Y40rS8PYfi+22u8GUCifnYAiGOxS6xH
         qSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+2CABe3J87oGmGpGl7GwWQxi2qTyg12kyqBFsNfaKsE=;
        b=NHaAr+iWkv6XS+TdAIXIVFIQ2S8icP25BzSr5Qesqnviv+sZG5rrphBhptQXJuu7aT
         IcCV5IPtLQ++lpchTPAf9wgyI7/hCDz2DnEPf3rVdJ5uRUPdVYU6NpZw1X7nzlPI+Pmj
         r+wGQn5ic2MxCgnm9OatOy+0xGL8/pduY+M6gDBM63ZW+H/o9EIy9k/3vJHdV5ROG2cA
         5QfxDS87yuqY0CiGlxNQVDxbqm3pfYsW2yQXKPbXzBwxagAVH4i1YX4r442mU/yAYZyd
         fY4tCcTLc+zNx9MjJrcxcUp4P9tvfpnxJi7QknEVaPI6TBSmiAghhDNlW2R+lgvH6tRy
         b9sQ==
X-Gm-Message-State: AGi0PubpxIJ4aUVvchd9ESRK6M3PFOs+ZiKVJiFal+dj/Gp5IoMWO75I
        016h5qmMdvaMbehmH/BqbSjepVenzT5/M1I/xrq6+1Rhvaw=
X-Google-Smtp-Source: APiQypKzHWfnTx/hkbe2s0PfVHV5SSdTQJcOehGIUm+PYQs+05JqmtPuZ9jbqfFYl2MaC68tKOT+e3S/nyKHvhp9R6I=
X-Received: by 2002:a17:906:1199:: with SMTP id n25mr4615915eja.30.1587149821543;
 Fri, 17 Apr 2020 11:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200416121910.12723-1-narmstrong@baylibre.com> <20200416121910.12723-2-narmstrong@baylibre.com>
In-Reply-To: <20200416121910.12723-2-narmstrong@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Fri, 17 Apr 2020 20:56:50 +0200
Message-ID: <CAFBinCDoM0d-5czQ4-FOTMPFN7r2FSSsfn9QCxF73GrEUsC7LA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] usb: dwc3: meson-g12a: refactor usb init
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 16, 2020 at 2:19 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Refactor the USB init code patch to handle the Amlogic GXL/GXM needing
> to initialize the OTG port as Peripheral mode for the DWC2 IP to probe
> correctly.
>
> A secondary, post_init callback is added to setup the OTG PHY mode after
> powering up the PHYs and before probing the DWC2 and DWC3 controllers.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
