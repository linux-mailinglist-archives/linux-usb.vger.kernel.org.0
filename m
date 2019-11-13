Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E06FB031
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2019 13:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbfKMMGl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Nov 2019 07:06:41 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:38553 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbfKMMGl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Nov 2019 07:06:41 -0500
Received: by mail-il1-f193.google.com with SMTP id u17so1552453ilq.5
        for <linux-usb@vger.kernel.org>; Wed, 13 Nov 2019 04:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gn4nGl4/aU01Q6EzAa3fpLh2f+Que5/VESf/QKj0oZY=;
        b=B1QP5B6eYq5LIlbVCQ59Z/Wwfeh6EV1ejBq9r7gfsJ22xS8X98NsaKrc9b+P7hZpPv
         BCTLc5hPIapniArXqGXuTVlAffhf97jI9aglCS8yiQ/r1cWqKoZykVnr+7E5qArCpVsx
         1hdfsYwt4IAGsYLUn03gjDQh80fxN0PhdWxJ0Vv9aMT5FLNuWOB9dXTasCpFyE39xAcK
         5QwjaV7XZamUhbWTM9dTtu9s1eMUWHYi/MYiWZucblfYxILMiUgiu4WQvi4O+eCX+OLO
         hTvXfdxsu9iJFS8QjVmGpZLiUt8/FWdCskfms/z9yYYmmI+Z9dyMqZFwV+ye00/q85E7
         lWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gn4nGl4/aU01Q6EzAa3fpLh2f+Que5/VESf/QKj0oZY=;
        b=aeidHS+NMHd2SX6oCZu0w8YnqKFEOh2bn0eKB+f9m3+PA+LxixV3h4KI2N0jRnbwfb
         zCRhS+j0D6CORUGaKckmXIZDLZ7CSutubEXLLM8Z+XXmVQweFYZt6VRpk7N6q+FVdfMl
         S0VRYuvhuQvzMbAdXGloOWkc56NTdi11D0lP6uXmoCWYzJwmEdCrkzbtLTd6oJacO5Ol
         2pTJlrRSIu0L9oJTfDNMunk0fipD5TwDUbs/3w0LfcslGJt9nqr5m7JF0K5IxTOJmIyW
         EcJUA5Fv7/bcckCzft00SRslVqmKHeL/0C3hauJ+ZrYXgnrUV0PerR6BWBXXQ3+c/Dvo
         LsZg==
X-Gm-Message-State: APjAAAWMUPTLLPRe9ICjvqNflqFISoQ+CDGiK91WotVQAvNcqx8izKKt
        FNUxJ8dll14C7jNCnkG0qHaZ93yfnpCupClhgSlF2g==
X-Google-Smtp-Source: APXvYqzPCgGtqD2CF1uekMJM7Mq641wAEaCPHuI1isGZ1xM5pAaXJGFVfBWal2CA40hcAcKiwZAyn86B635ps7JiwHM=
X-Received: by 2002:a92:5d8d:: with SMTP id e13mr3579936ilg.32.1573646798728;
 Wed, 13 Nov 2019 04:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20191113101110.496306-1-aleksander@aleksander.es> <87woc4qdea.fsf@miraculix.mork.no>
In-Reply-To: <87woc4qdea.fsf@miraculix.mork.no>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Wed, 13 Nov 2019 13:06:27 +0100
Message-ID: <CAAP7ucK5Wqcprj9c5sGLaE88-77EA3fB=sb7_0EK+7eoFAJxMw@mail.gmail.com>
Subject: Re: [PATCH] net: usb: qmi_wwan: add support for Foxconn T77W968 LTE modules
To:     =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Cc:     "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Just one question, which I should have asked about the DW5821e too: Is
> it possible to configure the firmware of these modems to USB2 only, and
> do they work with the qmi_wwan driver then?
>

I know these modules force a USB 2.0-only mode when they switch to
fastboot to allow firmware upgrade, but there is no way to configure
the firmware to boot into USB 2.0-only mode while in modem mode.

-- 
Aleksander
https://aleksander.es
