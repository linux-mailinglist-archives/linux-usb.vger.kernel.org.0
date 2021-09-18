Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E84F410735
	for <lists+linux-usb@lfdr.de>; Sat, 18 Sep 2021 16:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239532AbhIRO67 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Sep 2021 10:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239085AbhIRO67 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Sep 2021 10:58:59 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98193C061574
        for <linux-usb@vger.kernel.org>; Sat, 18 Sep 2021 07:57:35 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id e20so8016311uam.11
        for <linux-usb@vger.kernel.org>; Sat, 18 Sep 2021 07:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shantur-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=XoS+J3K7NduxwyLkch3X4LiuWC9AbSarqUpZadBKzuE=;
        b=nA0HvJoSwepMzKkGd92WisUtYXZEGX5sr7qobDUQuS/eHNZ8osXHK4HBon9tfVoJNC
         KPmSU/ZID79x/TIhfbyrTAduOE6WWQWCcUNPPd2ocfhx+SOWet44PlNLh9MKscKj0F5m
         GAwt29vXJyw+9+cg3c1tM6j5fthzDJFiuZLWcMpJiRjJwq3WvitwG4sW3QSV3QIWQWFY
         8djVJ85+dpMygOdgpPXIVovPAMjvVq4dAAsFUeLKDNtzpgnWQolUU5WW1k+SpBN/jyUy
         QMBJI/i6o3PYpsyt/A7qimR9WaALphnqmjxT/NRmNv/VzwCM41yEZJ7Js6zfl2cFJFdT
         tt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=XoS+J3K7NduxwyLkch3X4LiuWC9AbSarqUpZadBKzuE=;
        b=NqVgn0UudoJi6jAxTpIoYvq7Dtw2bQFu8y8c+OzHbLIly55NveNsl9KgVvEzieTAUD
         2oqyh9HteokAixLRYOXdtpQ6Mb18wKZX0P5RBdF0Foik1GUokavUzp3IyXKyqixe/JgW
         s/u5b1qvfo2jlG7a/jcw5Ahg4m9wdssHHO7/+DorU9jN/5iW9ed2rPSoTwPwIPpQZXWG
         P9VodWQKD1XnQA6ztsHsKTgsZf4Y5SE8EW0oYoGMCUvfXBIQzrikEDR8E1GiSct/DK82
         S99hOxmBPovazgppu9zeF1AhcvfL7zOdhF/LSufqKb82ChlhbZ9zqyvh64cHbahDh8Y3
         QM+A==
X-Gm-Message-State: AOAM532V3HSP//dh+nZdJGnO7nDIyaGvJ+PmE5KtdRV0PAxSSV6NOvgN
        rqvRwsh0BpzytaAEbpjIybHTPrFIDzVPhE4EF+ZpSrgLPU0ga/8s
X-Google-Smtp-Source: ABdhPJwje4n23CsC+iKuHQ1bFX85XuCsx0Trpx9/kv8txMMRgMCFCGU5WXZuXBven3uI9BUxLxmwzoBs4hKqkVLQJYU=
X-Received: by 2002:ab0:2b13:: with SMTP id e19mr8329444uar.3.1631977054582;
 Sat, 18 Sep 2021 07:57:34 -0700 (PDT)
MIME-Version: 1.0
From:   Shantur Rathore <i@shantur.com>
Date:   Sat, 18 Sep 2021 15:57:24 +0100
Message-ID: <CABEcMwVKFmie9Dx1PMRgY+yDWFN6TtTX0727aiWQvn971CbJwA@mail.gmail.com>
Subject: dwc3 over pcie or with more than 1 udc
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

I am trying to find a dwc3 compatible PCIe USB controller or a dwc3
compatible device with more than one udc.

Is there any such device supported in kernel?
If yes, please let me know which one.

Thanks in advance for your help.

Kind regards,
Shantur
