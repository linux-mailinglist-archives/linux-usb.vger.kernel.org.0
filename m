Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4612A3B905
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 18:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391466AbfFJQJJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 12:09:09 -0400
Received: from mail-lj1-f177.google.com ([209.85.208.177]:33429 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389392AbfFJQJI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jun 2019 12:09:08 -0400
Received: by mail-lj1-f177.google.com with SMTP id h10so2635254ljg.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2019 09:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0DV+cXYiDzvvwFdaaCfLgL/m8azDRXUs8LergpGYGyQ=;
        b=qyUScazkwXdl+mmkUD8JxuJkWbsyMQPPaPtDD//nX6G6l09MjNNuXRQKE/VJ3WBJae
         YL9iiHp/EIdApnYiItWr+Dn5q1C4TmMTnpSn3V0mOVgfloh8Ss+SGACSbn7F0MU3qvWG
         PSv7XcYn02J5H4dxDv0mzmEoVWlxYw9HANICtwcq6rFe5HTsBPOV3SXqQ2S00OBxHtTh
         6sDXTBj86Dbml78zg15P6fubIr749FUt7Huu9leTpACH746Tflz+FPOA9p5Mg2VFuFOa
         btE0MmCJkq2c3iToMyvmKMmCmvmGJ8/+HGEV2+bKUXGYQLj/9VuGMhsnFL0mF8mInjZf
         qg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0DV+cXYiDzvvwFdaaCfLgL/m8azDRXUs8LergpGYGyQ=;
        b=cvaT2BfRxIjeZq5pUGO2EIgXoAlONQahwr5ozAJxDvAJCmqtpqNFNO1YQ4bxtN6HBE
         TGi4hVYt/9iDPg0mVxG8bCueD2fgEqOOcyyAVa4rJBlgHUVTcr65IJtYjgK9QAF/MPSP
         4ZtlVaFmdsjqh4H444dmFjUAp7N6HBub4DvszQqQYpF8Ey5CADQlDq3KLoFJQIrThjck
         JdTyosbsiiZzUEg3Df5uerLIfSN10uMFbq0eOfg+NmEzc5DRvGTIXt4LbV4NuXpUmP6e
         1ODgScL7RjuSz9v4caP5VP6iMYPj6VzVIGf2K50eAcTOzv4gFmcTVTMDAbUO20U6OgQ1
         2iMg==
X-Gm-Message-State: APjAAAUuzFf4JaNgUqhIaU6MxGyXMR0QrXRrOIZNcjBVwGxvCX8pRC0R
        +1ENR32hHWVvL+TsBb6ZBqqaW0wyGluNGhnECl8=
X-Google-Smtp-Source: APXvYqxvfwN8+AjYV0XD5xBc7Ie4yCshY1KqPXtpUV2oE6qCtZiViIEAAoP+jZONZ0FSnTw0AJKrfgg5aBba2fr2sSw=
X-Received: by 2002:a2e:858b:: with SMTP id b11mr2056430lji.159.1560182946682;
 Mon, 10 Jun 2019 09:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <95d5902538997e340ccf7784406832904d512b51.camel@infinera.com>
In-Reply-To: <95d5902538997e340ccf7784406832904d512b51.camel@infinera.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 10 Jun 2019 13:09:03 -0300
Message-ID: <CAOMZO5AwDfCwVNY9TPMFJSoES=3MXxNXtBuMch_+9pFHfUUK_g@mail.gmail.com>
Subject: Re: fsl_udc status?
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc:     "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 10, 2019 at 4:53 AM Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
>
> We are trying to get fsl_udc up and running on a T1042 with without success.

I am not familiar with T1042, but fsl_udc is from the time i.MX
devices didn't have devicetree support.

i.MX has been converted for devicetree for quite some time and the USB
driver we have been using is drivers/usb/chipidea

Maybe you could consider using the chipidea driver instead.


> Seems like this driver is lagging behind the corresponding host driver(mph).
> The mph driver has a number of USB errata workarounds while udc has none.
> At least erratas A007792 seems applicable for udc too.
>
> Is the fsl_udc driver functional on 4.14.x(which we use)? What is missing ?
>
>  Jocke
