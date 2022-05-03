Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88470518BFC
	for <lists+linux-usb@lfdr.de>; Tue,  3 May 2022 20:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241126AbiECSRR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 May 2022 14:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241121AbiECSRQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 May 2022 14:17:16 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11A13EB83
        for <linux-usb@vger.kernel.org>; Tue,  3 May 2022 11:13:42 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t25so31681438lfg.7
        for <linux-usb@vger.kernel.org>; Tue, 03 May 2022 11:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=dTIYUeMHox/GwIxXX+zfjsIcggv7gCJqqIQGDVB9e1U=;
        b=Eyx2PGoVHzYGmfmWrFULTt68QN6iClYLNeJglulSeOS6kQBtiqtn3BJ2EzsEBcQtNP
         rntMyZG+1NAJOSsKdGlSMwLcrlLQ9n7U1KiZJd0g4ICyCeLcYrWM6BilkqVnhPBMUFSO
         ChvhRcYC7UNniIEhxCh37KkbR8FJvFDXG389NMtBur4TSX9G3UaoJ/iOr8oDLuQa7SmA
         sSnX/dWlHAWVGYBCVJp5b998b1sW/4MshkYWYspHQp5g2tWt2DyqvOM4BaaGQG3g0TMK
         wgfC0qnyDF6fhyNbEc6Aa4dn+IO6ygeW4b4z6TZPWId+bvSUapeTwMHzfW0QlS08Wbbo
         X8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=dTIYUeMHox/GwIxXX+zfjsIcggv7gCJqqIQGDVB9e1U=;
        b=QZYlZeaRwoxCC2TGdRsom5oWO87HLTesshZuCjUpzRoyiT0DxahIHwc9dCo6ARgmRX
         pwtoPU2uHCvgiCwR6Gb84Db96kbDZxubZQxRraAbD4l3PQCs00z2OP9i8oAh1A3E4tcw
         jX1GbmVCQrJp/BChfK5FhZ1oB8qu2+voiEQWHXm+HrXEa9fLDxqKOmVnrxLD/xD7AP/N
         GFOfbqZqp0DinAXVu4E20ptY5SZOmLZZCO8tw4mR3229bKKSs6eT5g26p9fRGoNcokrC
         t9usJOY1qkCQMbXPx4ay55V5AYAB+MYMQ9gee7aTlR/MBrXAC3ZrZj63AaS6tCAHKsBi
         P8uw==
X-Gm-Message-State: AOAM530syjKD48DMXcnYmyOnUwEJ0jts6uP6QONy1iLiT6durVMX5s8N
        /FlVaiC/nc0uA0Ol98yWasaMIaotEtIoORsiMSI0pR1Adl0=
X-Google-Smtp-Source: ABdhPJx17+aWjEU1tcY3vjMKODA0WYM9lbM8sNHLnEDRcLiP60wZ/1u+GAU2QUKSQl8E8J+EkI3596UchR8faBnUlyo=
X-Received: by 2002:ac2:4893:0:b0:473:a537:1be2 with SMTP id
 x19-20020ac24893000000b00473a5371be2mr4143052lfc.523.1651601620825; Tue, 03
 May 2022 11:13:40 -0700 (PDT)
MIME-Version: 1.0
From:   Rajaram R <rajaram.officemail@gmail.com>
Date:   Tue, 3 May 2022 23:43:29 +0530
Message-ID: <CAOiXhaJadiJnoFvC2ssVPH_sYK-+cT+66-5SwFscmQNet782Wg@mail.gmail.com>
Subject: [ANNOUNCE] libtypec_0.2/lstypec_0.2 is released
To:     linux-usb@vger.kernel.org
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@chromium.org>, jthies@google.com,
        Rajaram Regupathy <rajaram.regupathy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

HI

libtypec
++++++

=E2=80=9Clibtypec=E2=80=9D is aimed to provide a generic interface abstract=
ing all
platform complexity for user space to develop tools for efficient
USB-C port management. The library can also help develop  diagnostic
and debug tools to debug system issues around USB-C/USB PD topology.

Features
=3D=3D=3D=3D=3D=3D=3D
- Added discover identity, partner status and get pd message in libtypec .
- Added parsing support for VID, discover identity VDOs.
- Initial prototype for typecstatus utility based on libtypec
- Added wiki page for lstypec and typecstatus

Wiki
=3D=3D=3D
https://github.com/Rajaram-Regupathy/libtypec/wiki/lstypec-:-Know-your-USB-=
C-Ports
https://github.com/Rajaram-Regupathy/libtypec/wiki/typecstatus---Gauge-your=
-USB-C-port-for-better-UX

Release:
=3D=3D=3D=3D=3D=3D=3D
https://github.com/Rajaram-Regupathy/libtypec/releases/download/l/libtypec_=
0.2.tar.xz
https://github.com/Rajaram-Regupathy/libtypec/releases/download/l/libtypec_=
0_2_Source.tar.xz
