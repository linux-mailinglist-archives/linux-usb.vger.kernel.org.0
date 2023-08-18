Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A66E9780261
	for <lists+linux-usb@lfdr.de>; Fri, 18 Aug 2023 02:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353525AbjHRAEX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Aug 2023 20:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356597AbjHRAEO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Aug 2023 20:04:14 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5EE3C06
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 17:03:43 -0700 (PDT)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D9EF73F533
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 00:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1692316928;
        bh=Tmnlfhs95EL6waz9oCG9J1eFGjBYGw5AvYaX1Beaazg=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=sXnTLxO81kRpdGmMUNbf0PvrIpqEBnSeB0jyo2OB6InweEetK+qtfLYxBm0ShQy4i
         MHID4FqTYxy9M6pIoyUptFPu+pOIZiCfFgbHHVPlnm3AC5EwYZCvBJbTod8Wp4VQsk
         rpFB/xfZdc22uu+QAyG1QiPKTsxThzKehI4TBGE6FxXKMc3SFVeo2k8WRHBF+YIMZ6
         sa/Y+ZrcIdQMmaQLOfDq14rE28IwVRigdgbjqzU+X2dFR/UOJRbGUFyclbHCi1vRI5
         FPHrdJXwE5/L7pxE6e5696pjh5nIyOYU0aGsXMhb+cOl7Itvw2UuBRCX4VbfYS5aYb
         EPikjPjuDwU+g==
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-26b2daf44c3so479753a91.3
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 17:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692316927; x=1692921727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tmnlfhs95EL6waz9oCG9J1eFGjBYGw5AvYaX1Beaazg=;
        b=kav9dBQ85th0kkljoynojL32Ev+hlP4Boeu8Av1U43QyHTVQqDgWibdO4JibtElndo
         mzFXkwwfydionI2iNlJI9Czq8L1xzb04+durR1tEpUUtOGzPIYQeJgZSCWnMov3rZ/2X
         Nh0jw1vJ7BYVHx6K0By5S6W2n99F1VU5O5y+d0wJdvMtbea1eXjTYhaw09lWGh2337iG
         OakXXu8nVXHqc4GVpsTTbaK40G+tINYE5w8LJW6ahcZTS5lMu2Z+i/KydlEe+igx2ozN
         8TX5bXzTq4U/25uUm+fzPi40wQ7nQbbWA09JkNiJQhwHROHxDy2aycUgG7OPyAqvVm48
         j5Cw==
X-Gm-Message-State: AOJu0YzCy4J9fuCXCc43SGiV3Z9KNpqWSw77MjQVtC+Es/AfulOX9Kg+
        yfeki/RGczd/kfPHnUnImJ5m1oP6DBLAf1zJWH88MGcH5AHEGlKwJ2Y+YmY50KGlTjuduFOUmQ8
        ZmPbAWAc1XH7vb14dIBu24pyYZv4uPnRDeA+fCxAtvjvrrg/zkGN7Hw==
X-Received: by 2002:a17:90a:7486:b0:26b:c3f:1503 with SMTP id p6-20020a17090a748600b0026b0c3f1503mr1064243pjk.17.1692316927388;
        Thu, 17 Aug 2023 17:02:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+7EIVypmed5RGIhj0djV4fI4FSoK8WKnbipAJ8Tz7OsrmqWJYy2cffgUm1RSouUyrs3uw9e0d2WvEVxKlJsU=
X-Received: by 2002:a17:90a:7486:b0:26b:c3f:1503 with SMTP id
 p6-20020a17090a748600b0026b0c3f1503mr1064228pjk.17.1692316927159; Thu, 17 Aug
 2023 17:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230817093305.212821-1-kai.heng.feng@canonical.com>
 <cab8a29b-816c-41c7-8d2a-418f787e406e@rowland.harvard.edu> <59898e32-f2ea-4df7-947b-3d74835ff9b7@rowland.harvard.edu>
In-Reply-To: <59898e32-f2ea-4df7-947b-3d74835ff9b7@rowland.harvard.edu>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Fri, 18 Aug 2023 08:01:54 +0800
Message-ID: <CAAd53p5pxGfS0y260NsMF+m_Ota+d1ZKbtdq4dfM5s+T1z14bw@mail.gmail.com>
Subject: Re: [PATCH] xhci: Disable connect, disconnect and over-current wakeup
 on system suspend
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     mathias.nyman@intel.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 17, 2023 at 10:22=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Thu, Aug 17, 2023 at 10:07:37AM -0400, Alan Stern wrote:
> > On Thu, Aug 17, 2023 at 05:33:05PM +0800, Kai-Heng Feng wrote:
> > > HP ProOne 440 G10 AIO sometimes cannot suspend as xHCI wakes up the
> > > system:
> > > [  445.814574] hub 2-0:1.0: hub_suspend
> > > [  445.814652] usb usb2: bus suspend, wakeup 0
> > > [  445.824629] xhci_hcd 0000:00:14.0: Port change event, 1-11, id 11,=
 portsc: 0x202a0
> >
> > What is the meaning of the 0x202a0 bits?  What caused this wakeup?
>
> And more to the point, given that the previous line says "wakeup 0", why
> should any port change event cause a wakeup?

I think the controller and roothub have to deal with the interrupt
about disconnecting regardless of the remote wakeup setting.

Kai-Heng

>
> Alan Stern
