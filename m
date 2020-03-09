Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5692917D94D
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 07:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgCIGaz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 02:30:55 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44361 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgCIGaz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 02:30:55 -0400
Received: by mail-pg1-f194.google.com with SMTP id 37so77284pgm.11
        for <linux-usb@vger.kernel.org>; Sun, 08 Mar 2020 23:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=yybJ1QzXrgkr7XDf2YoWtEBzCY5FqWK4MqdNg1pgXOc=;
        b=U1DFSlHey9T/E8PLM4IJY/0dylRiAAHFvGZnWirUOQkMCY8N7t9/hLkzoLA31J5tvU
         wQurPIFF50OYGWyuz7WmPY/CJpDaE1d6mhTr4OmHVUnC5CQF75QJktLdij+rhhEBU7dk
         Orz8Jvlwf2lYSxGYjcGubpNoQwmyePVaOp8yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=yybJ1QzXrgkr7XDf2YoWtEBzCY5FqWK4MqdNg1pgXOc=;
        b=Z9/JEiJ/dbjw826xH68pZvXwzbng8ihXrVwusDICQXgz3wg8WSz9ON+q4plTD3F7m2
         YNmYRli32mnDT7GLpAsJHzZB89v9aVB1qxKuKzGiYHJ03P3rr0Ys/b1RhxtXpVVCZ3T0
         lyfnLZNBY4ZiruyZslW1P/TipAfZoVeCq8AJsDqebiyn+Bc4UEhkonvqYkM9NVGaaf3J
         guSR5moeX2PLvXACoOq6vPSYqEBsFU6EYw6p2fLDhh6j6RCZv++4hjgztwMnaiaiPqz9
         +QRqKF6FkBV/8Hg2iMRjopB/fvdMDv+csBzpo6rRakzaHx+Z2bEsZG2EY+yBDcC/Vkqm
         nN0g==
X-Gm-Message-State: ANhLgQ1oYS8/rKkb2gR5KYc6QiG5hbH5V8dfHtSETx7IuZWkMSvFSpiB
        2cMF+0CBv8tIZI/1F1FpjyH19w==
X-Google-Smtp-Source: ADFU+vtMGikTNZyTdc745utw27/3Wxa63ffNlpXgbhf7KCsot2ygSMqQQuTnOhQAQ+qnFipibZK1sA==
X-Received: by 2002:a62:760e:: with SMTP id r14mr8075667pfc.51.1583735452374;
        Sun, 08 Mar 2020 23:30:52 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h7sm45650104pfq.36.2020.03.08.23.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 23:30:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200306092328.41253-1-ran.wang_1@nxp.com>
References: <20200306092328.41253-1-ran.wang_1@nxp.com>
Subject: Re: [PATCH] usb: host: xhci-plat: add a shutdown
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Peter Chen <peter.chen@nxp.com>, Jun Li <jun.li@nxp.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ran Wang <ran.wang_1@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Ran Wang <ran.wang_1@nxp.com>
Date:   Sun, 08 Mar 2020 23:30:50 -0700
Message-ID: <158373545061.66766.10321933903764965708@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Ran Wang (2020-03-06 01:23:28)
> When loading new kernel via kexec, we need to shutdown host controller to
> avoid any un-expected memory accessing during new kernel boot.
>=20
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> Reviewed-by: Peter Chen <peter.chen@nxp.com>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org>

This fixes a problem I see where USB is still active during an orderly
reboot.
