Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD6422F1F96
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 20:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391178AbhAKTey (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 14:34:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390917AbhAKTey (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 14:34:54 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC182C0617A2
        for <linux-usb@vger.kernel.org>; Mon, 11 Jan 2021 11:34:13 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id k4so930306ybp.6
        for <linux-usb@vger.kernel.org>; Mon, 11 Jan 2021 11:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=0qe8ZxLLrlzwll+/NFwn3vuY/QdDVPeLtE68S0dwpxA=;
        b=shK8sxwGGHRvSxn0zsCoNKEr9AddxOplQxpfR+EaaGvJcYkclT4mTioDoZ1gp290JL
         WggtmvUUyyLgTWowOYGEfzL++bbHtsJ/GJRYOgVJS/Ih/GMPv0G8dwCM86TNvtkBOPza
         uimlEWLJ3jDyIYKg8HfKoeSStFZYWQ0A+ENy8yygIq/QS9zs4ogjhXF1TtwFVuOzxkFT
         Y08Y3ChojHrqerhnd3VVLFU2lt8gV1yWSLIrc/tZ2kSCPRfVGVmfxnMwvLYxnHJlEetV
         5nfXGVxxVz1cRlcU7FmT1foEBUlxjDaTOl+9ipgB6RdSwCcBdVDxOuedqIVYcK0HQCS9
         YJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=0qe8ZxLLrlzwll+/NFwn3vuY/QdDVPeLtE68S0dwpxA=;
        b=itMRAPYmG/3bNBDBzQ4zQJNvQx75bkTLtm82QLqeo/tJCe8farrA4AscSTL763IYk7
         L3Zj6xaglpi9ASxG0sE3yrgDoWhG7Fl4y5YWQt3jNBSplmmx0+PHgNRo77UEN1wA5fkl
         WWjP5nlfdeBNF4oY/HBi1KlM/12zXiee2ak8uFcruifEIYaMj+vPrIygHaiEN6U3tV0w
         hn/2vFmSlyLYkEaYB9qHs7QDytT32QK2ThVNyMc7rmvjw0dBKkSeakudjVrq25k481Xg
         o9Ua89MXOf8a8/f2oqNinZLWzWhEI3uKAMwkLtJvfnMAzFINfWy5WCCEmj6sIz3HEOCq
         qYZA==
X-Gm-Message-State: AOAM530NhabpxjPbAGexROraK/z8YbkwJRYPlU7qsDrLw7SeEMvCEBK9
        CpUNQ3ZrhmFhnQeQDdp/pOQC5OqfljbO1mdksJc=
X-Google-Smtp-Source: ABdhPJwrVY/VxWSxaajEe/HEJ1oBJTtptv0SpbKSOzKRetpGz+Z36F7LXPTyA0MZoqdwkS9tCTqZogepyZMZAeMfwdc=
X-Received: by 2002:a25:df03:: with SMTP id w3mr1714086ybg.189.1610393652927;
 Mon, 11 Jan 2021 11:34:12 -0800 (PST)
MIME-Version: 1.0
From:   Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Mon, 11 Jan 2021 20:34:01 +0100
Message-ID: <CAMeQTsacNs-YVWeX6vFJyMBLeD_AX6imNQRodV_X-QS54wAREA@mail.gmail.com>
Subject: Conflicting PCI ID in bdc driver
To:     Al Cooper <alcooperx@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Al,
The PCI device ID of 0x1570 in the bdc driver (bdc_pci.c) is
conflicting with the Apple FacetimeHD webcam [1]. Is this caused by an
incorrect ID in the bdc driver or are there actually two devices with
the same ID in the wild? If we have a real conflict, how would we go
about solving this?

Thanks
Patrik Jakobsson

[1] https://github.com/patjak/bcwc_pcie
