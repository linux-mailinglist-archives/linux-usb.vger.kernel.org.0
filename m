Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5142D39E445
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 18:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhFGQqx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 12:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbhFGQqw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 12:46:52 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5065C061766
        for <linux-usb@vger.kernel.org>; Mon,  7 Jun 2021 09:44:45 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id b12so3042155plg.11
        for <linux-usb@vger.kernel.org>; Mon, 07 Jun 2021 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g2fubb5r3Ekskdxny80qSYuGJlyYIMGKhJWLNJ6m7zc=;
        b=JeucdIYlWbyri6ZOWU5hYnIa1riL9/oLTP6qyRj3w/RWY15tv5lZOUjqZqvoGYmyT4
         WOgJ8F2FCxcldtXioP2q4Jaslyf1xAWL/TAwSjAyM70XQfm3naZQUOwuQbyWRaf6oWeW
         MpApheKnn+pI1k6UIlck/lNhk9i97AS0Z4jd6UsARIwDVRxz7DU5ttnuorG7LxFOZuvR
         4uU9pOYTCnnn7iaTeqc+UcpOURQgy2eD8NzpK3iP84g1BWgjvI5zeO7gUEuL8KA05fG0
         vIFYCSgL0sH5dbLA/lxBrfy9ps5TyaAYbCtlepIGcOSnjr3Y35tquvQp3x9eaxfLut1k
         gTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g2fubb5r3Ekskdxny80qSYuGJlyYIMGKhJWLNJ6m7zc=;
        b=e/sKb6Mwepceei2q5zxtjs3DiWxjf5BZZQqmTzjmsoeDp5q+SjelIL38Uu66TWRVf0
         kmpGlSykWMk3Tzd9lkKzaAxXCX2X68T7lvdOE5TCqe6lLBcIveI4Rm9vZZ9zOqsCNN4O
         t0GDPevGudQRP3bs5+TYSh+wGpHtGc9GulXcV9ko0TJgU79qH6fhew33vQrgahkhU0xZ
         3MTSVt2eHI6C5vsFts2sK3XGlxx6N06mkAQCHOB+gIQC4Tj0lK/wVpA1G0v/W60glDM9
         mt4Is7FiMXYulMysbRq5CdDfNOGmyCeref6B1CReX4fzuCWhml9nvZjiLX4etWwGqMAY
         EPvA==
X-Gm-Message-State: AOAM530hgME4qejCgJhqLr5Y3gYowJbYVT8w5GdOKdDUnFj1L576CinB
        ZZjzlibNdY3JB8DrB0usBK03eS8ADvdXKYM8FWI=
X-Google-Smtp-Source: ABdhPJzwEVmm84CwzOx2n5F0caNq9f5eisYo/K88/StotI6fdykGF85aEbQA5hsGsreDsdIUQs5l/ivEEY76pWKI1/Q=
X-Received: by 2002:a17:90a:fee:: with SMTP id 101mr35401pjz.230.1623084285461;
 Mon, 07 Jun 2021 09:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
 <YLXmrmW9/fB1WbzR@hovoldconsulting.com> <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com> <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
 <YLeapcNbvExeGKuE@hovoldconsulting.com> <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
 <YLpJzTmAnfsrE7UP@hovoldconsulting.com> <CAAvkfd-vmi_VJrCQg-ktF+sZZUfb5J+DJfjHv=TdVafyj1m1Ew@mail.gmail.com>
 <YLtOL5aZUnntfqWB@hovoldconsulting.com>
In-Reply-To: <YLtOL5aZUnntfqWB@hovoldconsulting.com>
From:   David Frey <dpfrey@gmail.com>
Date:   Mon, 7 Jun 2021 09:44:59 -0700
Message-ID: <CAAvkfd-o+g2_uc-HqK8svrU_E3NB1m03md8J_F_eTc8pDkXmdQ@mail.gmail.com>
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21 (with bisection)
To:     Johan Hovold <johan@kernel.org>
Cc:     =?UTF-8?Q?Alex_Villac=C3=ADs_Lasso?= <a_villacis@palosanto.com>,
        linux-usb@vger.kernel.org, Pho Tran <pho.tran@silabs.com>,
        Tung Pham <tung.pham@silabs.com>, Hung.Nguyen@silabs.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 5, 2021 at 3:13 AM Johan Hovold <johan@kernel.org> wrote:
>
> I found an errata for A01 on here, but no mention if this particular
> bug:
>
>         https://www.silabs.com/documents/public/pcns/190315471-CP2102N-Product-Revision-with-Datasheet-and-Errata-Update.pdf

I believe this document has some more errata details:
https://www.silabs.com/documents/public/errata/cp2102n-errata.pdf
