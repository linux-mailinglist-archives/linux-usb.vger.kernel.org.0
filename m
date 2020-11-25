Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386A32C369B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 03:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgKYCOB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 21:14:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgKYCOA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Nov 2020 21:14:00 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9329CC0613D4
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 18:14:00 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id j10so627560lja.5
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 18:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9FR5I/cNwMT4l2zDFB7f4kMZNoZytMH7e3lHR0md76A=;
        b=lwHG9uugevi9wBYb8Rq0hiexW/cumnlfcZKK118m1noUecFwPZImoc2m39rs6tSYOq
         R6gIR7LtVje4GsfHXksbxuVKKIQVEc2+B9ezhklBaVRLOntBkRqawPzZAGIaOKxQx+7s
         7AuK7gL62jKpgqwdeDkdAGhCoK5g6dlHd7FlFyJvdmUSfmiYqHqM3rHVEXviusV69t2h
         A2B8zfrsq3G77/JFRfwZHx6Jc8nm6xt1YrECCkljiICLYhui0wLPHx3frk3XIi7gV4bP
         kVPjys8MeXmAU2ow68pdUX4kqogDX5D2IjQ2/c0jbYHZ1vQWXM/N/VBBh/l/qxzU9MBR
         UfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9FR5I/cNwMT4l2zDFB7f4kMZNoZytMH7e3lHR0md76A=;
        b=B1IKE7f7nNoiow4r5VUrvPb1tOVg3s2uqmcdouuraofyAR3W0A7OBjLXboSnTieVl3
         r1bbiM9phFJyo76Mkv8sytmhg08RA9+6DUZtjKJaSJ/c8Fd+AIUyll4PHtPd84rflY3W
         xrtbWMp0ZkvEfkOZTcF22v7MA7e2JliGwcZWyTVVXcJKpok/LQU2WmCoH1Ra0Uf0WppW
         xIGZNIm96yFmubDnABOHXU93LAaUdwGF3RCWE9fQ6tzCT3yZdGvFGH+RnqAukByNwE0O
         X04gTfwdv7w0gHHo2E+3cM+pI57ULH1hPxC8TACdhHM8uueumN/LzdZvUYJo93T49ku6
         ElPA==
X-Gm-Message-State: AOAM532XLvjzz8fQAY51c/CtPyXN6UH9ndNYQBHSXlJcdsvOrogq51Zr
        aV+U6pIpoxSneokIrNjQP/L7i6Kd3zwsyW6jCH0=
X-Google-Smtp-Source: ABdhPJzLBKHnaahSkVlGKAQ2Zv1nBMs+Exd6n+/QlIbYMNVHZUSZiV2RtP9bXCpxXPe7/LTFW6Ntq53O50YjXmk5IQA=
X-Received: by 2002:a2e:9450:: with SMTP id o16mr417439ljh.178.1606270438900;
 Tue, 24 Nov 2020 18:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20201124163912.12074-1-festevam@gmail.com> <20201125011447.GD9929@b29397-desktop>
 <CAOMZO5A91b1cVgakrpPtGpGiMDzCKQ1Z37Ae8UX4LbskwYO4gw@mail.gmail.com> <20201125015742.GF9929@b29397-desktop>
In-Reply-To: <20201125015742.GF9929@b29397-desktop>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 24 Nov 2020 23:13:47 -0300
Message-ID: <CAOMZO5Cn9ixUr7M=V+azhSo43wG0i_PAqgkTaXUn81ppsMnAXA@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: phy: phy-mxs-usb: Use of_device_get_match_data()
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 24, 2020 at 10:58 PM Peter Chen <peter.chen@nxp.com> wrote:

> When adding the new SoCs, the new compatible is added at dts, but forget
> adding at device driver's of_device_id table?

In this case, the probe function will not even be called if there is
no matching.

Please see:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.10-rc5&id=e6c7c258f035ffec9d8a808c1bc34b6a5beae0ef

and
https://www.alsa-project.org/pipermail/alsa-devel/2017-January/117275.html

There is no need for doing a NULL check on of_device_get_match_data()
on a DT-only driver.
