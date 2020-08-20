Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601D424C0F3
	for <lists+linux-usb@lfdr.de>; Thu, 20 Aug 2020 16:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgHTOw2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 10:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgHTOw0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Aug 2020 10:52:26 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01FE8C061385
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2020 07:52:26 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t11so1147064plr.5
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2020 07:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=BY1O1OTBmtSM43L+aAmpZ14OvgTFZMZ9u8utr1Ekf/g=;
        b=Jy0bsW1SMzHfDYYerkAfBYezgNVqdImO6Qqj0p8NQpV1ZGFisEqKLvxf8SZtXJpIVi
         v0/O7aSrlbikDPUUlXot4FkQpIargfbUr4/+dA8dOBd5pxaIqIZhP3NhZHIIgF0NwpIZ
         del0L1p/VEjFdumHQhLyeUw3Dkygpc3cMvqVJGxzWOdunopCXcFM2y6RWuCz/BOhJ+N5
         nXHA9yioHNd341V5SCoD2qN6QqStlWvIW1zRM4DnX6UkSc3JuTfOHWbmWMyvjScxAB24
         XJE8q28HFoCdR/n24rc95M169D/eKuEglLUo80yb9h1cbeyE7ds1ZpNC7APon0NCjr/7
         UBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=BY1O1OTBmtSM43L+aAmpZ14OvgTFZMZ9u8utr1Ekf/g=;
        b=f6CaZ22r3OpOy4KnFuAzAQEVt22+rz0PBU7SSWZ3JuG6cOtLpEY6IxjQJRKeBTQR/Z
         LAbbfvVF8YvzVxckgGod1TuMhzkIuuK8lacICRKEzxc8kCpul1FbV7dc7Zq/6kA+vuNq
         eMTPNyYWnyMXgAOGUUzUB7PJO06aUjD2zOSIGu21UqBsB5iS68DXiw1gkJVjzb4iOvHF
         /iZwIwdY8/OTj0dWWSKJzmzHkgXMUR6zR7U9wzanwvwgQxb0mS1S4tQCUqFRON3G9nQG
         dSuuTI+jdPeaOder2fmo39vwW0Lgzx5+nLCQVInlJy4nYXwnQhAfpUoX5jp68+GZzMtB
         5Qlw==
X-Gm-Message-State: AOAM533/DYUXBRAAfjcSIXfmXIgATWggK/53ZxqgjA3UKJ/WQnbosM8d
        sa6r1FsT3ZVEGQ3wK06DbRsfGnLqA9QIcCvpGQDyeNLxN2o=
X-Google-Smtp-Source: ABdhPJwodCBoGJ5Mbkefve6QlnKAc0LXJcvtLkFSj4SHT/GamIXr534KuRs3moGe5cuxB4PdgufbS8N06nLQ+64Cb5I=
X-Received: by 2002:a17:90b:1903:: with SMTP id mp3mr2735168pjb.14.1597935145655;
 Thu, 20 Aug 2020 07:52:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:150d:0:0:0:0 with HTTP; Thu, 20 Aug 2020 07:52:25
 -0700 (PDT)
From:   KATIE HIGGINS <katiehiggins841@gmail.com>
Date:   Thu, 20 Aug 2020 14:52:25 +0000
X-Google-Sender-Auth: vCiu3kgM_hvemnGXohu_8uR9F4s
Message-ID: <CAA4+kGZYJdy8wGtwLZfzkW0OZawJjRt8rFnMxSvRhLrNZYQvyQ@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

LS0gDQpIaSAsIEknbSBDYXB0IEthdGllIGZyb20gdGhlIFVuaXRlZCBTdGF0ZXMgLCBteSBwbGVh
c3VyZSB0byBtZWV0IHlvdSwNCmkgaG9wZSB0byBkaXNjdXNzIHdpdGggeW91Lg0KDQrll6jvvIzm
iJHmmK/nvo7lm73nmoTkuIrlsInlh6/okoLvvIzlvojpq5jlhbTorqTor4bmgqjvvIzluIzmnJvk
uI7mgqjorqjorrrjgIINCg==
