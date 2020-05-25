Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F11131E10B5
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 16:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391001AbgEYOlh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 10:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390896AbgEYOlg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 May 2020 10:41:36 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E15C061A0E
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2020 07:41:36 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id c21so10643699lfb.3
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2020 07:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sKTwUD/IIGQpHAJ+FqJWqkIseBkkqt9E6P1wz0Yt+zY=;
        b=Uouxj1IiBGzeo/Jvm5fi25ZFRDdF45HPxHPdXcP60AB1+SQwO82OsNsEg6wGeOZdlS
         PItN58FL+1rASgU+zjLSNJXyB54tO6Y6eSlBZYDYM+VbyLGEhUfvCZ2BFP1NoWxXpbVJ
         CN0tc+O52DDgpBoFW5roJ1cPpNM2VtCE3WtnkVQAqVhKblNgyxXYAFYwqZzjo/Ds41OF
         8/H71BbBaQeOVgwMobU0mDNpkXhZpRHNqX+V2vbZe10xYewt3OVbY0zQiMBXAJJs0zcY
         QBpbgZnAndBGsuSi7PdIjBkkwqOYKQOOSLhPbgC+zVVoEer0kLkzL0bKre+qC0Dl1mhz
         +WtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sKTwUD/IIGQpHAJ+FqJWqkIseBkkqt9E6P1wz0Yt+zY=;
        b=Iaq2MnxS6KUd/ggx7ti/B/yvEYVi1V1ge+usBvUhB6/TBzfmAQNCOKpRrlaC/Lc95u
         7eptxLks2SJeOs02yOJ+suOHIp0c3YrAANdbIUj6ywBwvIYQ6lnLhd/feTh3tSsbA0ET
         Z1PDPf5RF2f25eAgOggnifYsLvDrOfaTh1/EEbSFjwHviuENpHXeZn6OIK23qsse/8iu
         VlLiGej0d65oxlXpJlKQs2iVnsChLGArAv8N5uu3sPZNhoerRINNZcwfMA3Q9Czb3vXk
         XmuJ6iuWaI1PsXF3AV8EUKqffs0j48DzSLSOIxIhhhTc7qwRopvq3uepWRApUnN4MBDO
         W4xA==
X-Gm-Message-State: AOAM530mA7XVGBnZAqn4EEgCVpRKzQ4Qbi/dImxGovpSTEG2ips8Kavf
        pimNUDXUCIS8IgDrWGkH3KjrOE/oXAooXVTgCrH1pg==
X-Google-Smtp-Source: ABdhPJykLh0po5IalBJUCBgDo9y1+DdHwd+HNRSWpIECMzc0gkTRrq6bFUnsEZ+KNfaVmmyLHO37SqvUMmWH7mG/2nI=
X-Received: by 2002:a05:6512:d1:: with SMTP id c17mr14414734lfp.80.1590417694402;
 Mon, 25 May 2020 07:41:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:a48c:0:0:0:0:0 with HTTP; Mon, 25 May 2020 07:41:34
 -0700 (PDT)
Reply-To: jessicahaver699@gmail.com
From:   jessica <akimkounoudji@gmail.com>
Date:   Mon, 25 May 2020 14:41:34 +0000
Message-ID: <CAEq6z5D8w4E2oZbFQR-7yk9SZF1QS=59wxb=z86RzND7T5rfWA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ahoj, u=C5=BE som ti predt=C3=BDm poslal e-mail, ale nem=C3=A1=C5=A1 od teb=
a odpove=C4=8F,
odpovedz, ak dostane=C5=A1 moju spr=C3=A1vu ??
