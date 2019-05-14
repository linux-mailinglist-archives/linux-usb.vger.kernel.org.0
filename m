Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7229A1C874
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 14:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbfENMXa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 08:23:30 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40489 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfENMXa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 May 2019 08:23:30 -0400
Received: by mail-lj1-f194.google.com with SMTP id d15so14105532ljc.7;
        Tue, 14 May 2019 05:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3MRGyoxQqmQN/cZty2DfpvZ+zHLAV84AIpe7rHiuPWQ=;
        b=Lhwao41X96R3V363bIIPdKc1z8jhBuoTiTpm1E3GmeAoKEjaZ9yoPYZq1/nV381+GR
         6FOkclqnJu0ugwvejtde//MAtlNk2eOVFMsM4ZVjl0hk5tZ3ObM2IPVyQDu1AkKG/z2n
         CIeA3hAcHdeUvCXazfrsJBPA4xRoKsZd9dTNGDaVuyHXOWA/3DnhqwGDg5KIIF+MVVyR
         Bk01T7EWsQsfR/lMhVoPndBUabEG3g4oTmzorVIK6CdmKha47zInsX6YXlA5engZJoX+
         mN5ZXXx70U4vz0x7dn4dedEFoJomihrKEb4qh7uWgnIwXrkm/Bwvsam9xgzBAvACtu/H
         O2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3MRGyoxQqmQN/cZty2DfpvZ+zHLAV84AIpe7rHiuPWQ=;
        b=qIfF0q2Fq/1ACpEN/u+c1KReuD0E/Qz3qrbHPfShsJ/ZxicqI662RedLzDKHtnbsEU
         g9zkCyB19OzVDyJlh6gd4QgI44ipciVIzjGFfZ+2Amff/rJkBawxKFx+kp/30pgrgQsD
         o7yxBu+YV3PIWdFGWXKQetwINN0moZjgMskjnORQpiom4EN99qpjJMOVhErd6GCTd30P
         1s7htf2SsvmCrZKA7gQqye+m1O36XDnHrScm7lPECbTN3MJewbZb+jyQWqPfFq7odnX7
         1tisNeeAfM+SxXIn05lgAiPNotmqBVgzZ3mKM9UOwhQTuXZnZRXI38B33I9KVwvewX2J
         yG2A==
X-Gm-Message-State: APjAAAWwFH52Nc7BMt/ba92rWVpNypp+uH2IiQvDHiOMhLGZEXjgLLwN
        QaAm9xu7OZq50DIV0iRDSC1Xt9Cx0K5whoxt9fA=
X-Google-Smtp-Source: APXvYqyriOLyKC/Kee2yqH++lJP7hxSViMVYgJWwoXlY/6NB6M/1jXCNTU0A1P7xzLjQPHUxTBcIzABNX1o7b7iVLbs=
X-Received: by 2002:a2e:5dcb:: with SMTP id v72mr18001473lje.54.1557836607548;
 Tue, 14 May 2019 05:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190514073529.29505-1-peter.chen@nxp.com> <20190514073529.29505-6-peter.chen@nxp.com>
In-Reply-To: <20190514073529.29505-6-peter.chen@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 14 May 2019 09:23:24 -0300
Message-ID: <CAOMZO5DzqeDkfOh7gw7xQYHF1pDfe-LbC2jGybVDpEKUor+NNA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] usb: chipidea: imx: add imx7ulp support
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On Tue, May 14, 2019 at 4:39 AM Peter Chen <peter.chen@nxp.com> wrote:
>
> Add imx7ulp support

Since you are adding a new flag CI_HDRC_PMQOS, it would be nice to
expand the commit log a bit to explain about it.
