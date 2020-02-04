Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C35415210F
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2020 20:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbgBDT3g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Feb 2020 14:29:36 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35483 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbgBDT3g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Feb 2020 14:29:36 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so19869567ljb.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2020 11:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/HM5mji7KZVUrQKRnd4ba9jTmfjhkKMlqI2S0xOauPg=;
        b=CT69CGGb/wyhd4i4+dq6rLH5yBuGl1U74TYC4aWMMw3E2cDirvTFSx11Mbkc7dIK3X
         5wlg1QgCKKGrMgtf4sSbBGhnEBQe93FDpoUq8ioeIGSHMW9MD0h0rGTtBHbusNhe+9GJ
         RZS+tP2KF9lWtXM8ETAvthi153nYGqMg6TMfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/HM5mji7KZVUrQKRnd4ba9jTmfjhkKMlqI2S0xOauPg=;
        b=XF/6u+kwfxB1NAdtF+GjO8WLYSvCgst+xoUmDv3VwMH/TpSy0m7sPqJYBbqvPg5SD2
         L3MTC5pT24wCp2RA9lhpfaF0+ruYIA8pd4iOktMYF9btkUxTuvwzh3soW1A1fYpj3A3Q
         WHvAawfaumCWGfyu07aLJEwQq1Rn+Gj2xUazd5g0Bhz3HD4D2DcvbZdnfQuSO2tclZwW
         QgaJ7oUx5EFwfSrQ0L2VSPm4YGeQLyUBUugDKIzA4a9puoK4yhVt8jQF4VmVR+LTYOXt
         Qq0DTsHrqAlCulrPmnK7SnTJfiUBAcd1mq4jKoVKxpucydT+7lxZUoEf7GuCI4+Uzm1V
         omUw==
X-Gm-Message-State: APjAAAUzvDrL7PNi+HPTXTuXfsbT1Nmtx3YZ0xNcGnof+NA9kQDYR7l+
        53QN4ccOq9rK33WCuYAoQ/q9AuzEzFU=
X-Google-Smtp-Source: APXvYqwU2MjNsa4NZJNxU2PNqe9qcn6z0yVeGQ1o+n2nozEVMOIv+zeobX+a89DXH4tojbo660vj8w==
X-Received: by 2002:a2e:9b03:: with SMTP id u3mr18338698lji.87.1580844573756;
        Tue, 04 Feb 2020 11:29:33 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id y29sm12121732ljd.88.2020.02.04.11.29.33
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 11:29:33 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id r14so13036445lfm.5
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2020 11:29:33 -0800 (PST)
X-Received: by 2002:a05:6512:2035:: with SMTP id s21mr14945994lfs.99.1580844572524;
 Tue, 04 Feb 2020 11:29:32 -0800 (PST)
MIME-Version: 1.0
References: <1568718649-20124-1-git-send-email-cchiluve@codeaurora.org>
 <1568718649-20124-3-git-send-email-cchiluve@codeaurora.org>
 <CAE=gft4ZM3H2eODOwdpOC5tBkRV9BBHPnya_rOy3mNmqH2Y3+Q@mail.gmail.com> <20200204191654.GA18972@google.com>
In-Reply-To: <20200204191654.GA18972@google.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 4 Feb 2020 11:28:56 -0800
X-Gmail-Original-Message-ID: <CAE=gft6vDvF=+TppK_d1qRixraSwgYJZULaBvRdUJv3jX=5dDA@mail.gmail.com>
Message-ID: <CAE=gft6vDvF=+TppK_d1qRixraSwgYJZULaBvRdUJv3jX=5dDA@mail.gmail.com>
Subject: Re: [PATCH V3 2/3] usb: dwc3: qcom: Add interconnect support in dwc3 driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        balbi@kernel.org, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-usb@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 4, 2020 at 11:17 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Tue, Feb 04, 2020 at 11:05:41AM -0800, Evan Green wrote:
> > Hi Chandana,
> > Are you going to spin this series? My comments are below, I see
> > Matthias also has comments. Please CC us both on the next spin.
>
> v4 was actually posted a few days later:
>
> https://patchwork.kernel.org/project/linux-usb/list/?series=176783
>
> I also missed it since neither linux-arm-msm@ nor myself are in cc.

Ah, thanks for the pointer, Matthias.

Yes, please CC linux-arm-msm@ and linux-kernel@ as well as us.
-Evan
