Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B873DCAD7
	for <lists+linux-usb@lfdr.de>; Sun,  1 Aug 2021 11:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbhHAJDt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 Aug 2021 05:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbhHAJDs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 Aug 2021 05:03:48 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3701C06175F
        for <linux-usb@vger.kernel.org>; Sun,  1 Aug 2021 02:03:40 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id e5so16235885pld.6
        for <linux-usb@vger.kernel.org>; Sun, 01 Aug 2021 02:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=gUiNM59ujHzjyyoWPo/W3emPcp8EnI8sdNh//LNYp4Q=;
        b=VCHLA+6KQNv0D71Znq1YnUPiH2pOLPHK3TvC6KVYA7/pHGL8Y7LD0+EhQ2Q4Ynzs4P
         EA2tVpM5uHiYchlUNWyHE9i19lke6hK2S9vevJaqL0blBoBlLaqi/yYrBs3e/xbQQ56J
         7ZB6vk2B6kp3soD1a1DxypTuIKAgCGSZlZEzHmiOPlTiBtVER+vMZZ0hN+BohrGdTOfa
         IhTRlpu4ndrw/hu1N2JFU4zPFCaoPc/pWu0CK2s/hkFKGQioAHZjwiDlbv7Dls4WQg5d
         BQ0ZS29t7ciIrMy1LluYdmJSGQMiW6bxsPophgOmcmhu2M0dJZweE8drELy1EJ29VQkU
         4BBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=gUiNM59ujHzjyyoWPo/W3emPcp8EnI8sdNh//LNYp4Q=;
        b=rWnoc6DPiaX5wn0b0zB/Wnq+hox4BB8qnMsaR6MtffdDwbjQIgEfY/XlZolafa8+5P
         b20mu5SjeqS20N/kqu8YbJ+qHXckNUlYesl8h301lo11ASwzM3ZhHs4gpIfh2QnNF8o5
         EbQNskDXg0Qb5F1mUWiwd9IKOPsiP2NfboMFsH7IISA4V1kzjsM8B/+ajReCO9PGbZ3+
         UHfuiUrNq6L3jHsBOUAXgtwCPz1Ff7zNmTUh5ASirpjuny7bBTnMBksauO4K62hIJIwk
         I6U5u8bFlk07MdMGBQ0D3q3DoSqHAhCqYwR+C321oRybi1d3hCsn7weaxFd+y3gZIHMT
         BiCg==
X-Gm-Message-State: AOAM532EgT532t4v8RBEj+5Ym9WX4M2bSxJIjCk041dkEe4Em9M/Im5I
        TgMwYqEBOevdZGiYknrr1FckO+JA1lBEDAvOPLigzpuDEVg=
X-Google-Smtp-Source: ABdhPJwut4BAlHu1x9WHUnIp/2QbXYEuJk8Mo6cuG4IjAHQGmPeMGlcWzK2l8fspqmkl9ObUShQ4EVm1KFaCQoRdRTM=
X-Received: by 2002:a62:1d06:0:b029:3ab:9703:b6b8 with SMTP id
 d6-20020a621d060000b02903ab9703b6b8mr11316104pfd.0.1627808620483; Sun, 01 Aug
 2021 02:03:40 -0700 (PDT)
MIME-Version: 1.0
From:   nil Yi <teroincn@gmail.com>
Date:   Sun, 1 Aug 2021 17:03:30 +0800
Message-ID: <CANTwqXBzZaPGomgsy00RhgTHvETWEXg_ZiL1ujgKmEU2TUsc_A@mail.gmail.com>
Subject: [BUG]drivers: usb: serial: mos7840.c: dangling pointer in function mos7840_open
To:     johan@kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, there is a dangling pointer in mos7840_port->write_urb_pool[j]  in function
mos7840_open in v5.14-rc3.

in function mos7840_open err path :

717: err:
718: for (j = 0; j < NUM_URBS; ++j) {
719: urb = mos7840_port->write_urb_pool[j];
720:  if (!urb)
721:     continue;
722: kfree(urb->transfer_buffer);
723:  usb_free_urb(urb);
}

leave a dangling pointer here,  I'm not sure whether it  can be
triggered somewhere.

Any feedback would be appreciated, thanks :)


Best wishes,
Nil Yi
