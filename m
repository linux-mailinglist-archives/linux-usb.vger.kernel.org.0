Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4DC47DDA9
	for <lists+linux-usb@lfdr.de>; Thu, 23 Dec 2021 03:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345766AbhLWCSP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Dec 2021 21:18:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbhLWCSN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Dec 2021 21:18:13 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63768C061574
        for <linux-usb@vger.kernel.org>; Wed, 22 Dec 2021 18:18:13 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id v15so6880499ljc.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Dec 2021 18:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=FiL4hPd6bHH2JiHzetGhPse/xo/t09I5izcyOt+qs+c=;
        b=pTdEBivbrOv/Y0uaFL2GqyX0DRuthiWx6agCPddW8V5QXbSrFnXWvj5gkQaEOaAMt4
         PrDiGm/rwg4/yk+L6HOg5w8j3XG5Zt+ocI1LsKyVtWFdbKERaC0t4w1ksbSCJ95AKvZy
         TCrSf3p83VP6bq0YXH/JyeWWIb73ZL1lRHITkGFNW8vVIIippg/fgUU1JFfphicOS0hk
         lHcLQPiaJ5qPPYXf7+aqFF+q6yZM6Ei1c+KZ5dest86u8rJs12oMmgD6Llm7FriyHy7T
         AUyHeCFQqxWC1RzjV3OReFS8VOz6tyeZwdtndEJViaCJcN1AUtwXvLUFcDW12G7ggXRu
         E9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=FiL4hPd6bHH2JiHzetGhPse/xo/t09I5izcyOt+qs+c=;
        b=1Y8vXCqWybCPPxcxIUkQc9X1RdOjnilglcPB3X//v/nW5N2oK59yLUmWyk0bXGgDw0
         E6onA7RxUDnGVC+cMXPNd91pUNv2N6YrhQeVgY1/f3a9x/I3LfYbMaH5AvCoU2dK6bMI
         Jr84weIwrgXxS5aY56cS0E450u+0VdiF3PqGRQlwYF73zFkZOMMD4EufFximQT/QJhpN
         LkZsV2KhAdQqN6UQ5HAOelFt3ni7+w8a4zU00YXVooyKKDuWl0/rvrrpDPLHOK3tSBO9
         W0E5o2Z4wsGDx9dhAM4ZbnW1TLSgW+V4F+Hngh953gT2ZDZtMXSMVyuV3aMCmHpx5sya
         4sXA==
X-Gm-Message-State: AOAM533VNmlaEr6k3N/EDUx+qlzY6DLPHPj19dzq6UrwNd1BwHIk44Zl
        MrnN4mDtYmKbV8/BRYm+xHnJduEI19Makg1arzc=
X-Google-Smtp-Source: ABdhPJwHCtcjW+psCCar7A0LJhZHxS581D30IvWCcvcIRYTVi3EBhFaJmpgrP/Bgp6P6c1pVdaNrN2JmNjYva9QgSMs=
X-Received: by 2002:a2e:9697:: with SMTP id q23mr228313lji.354.1640225891607;
 Wed, 22 Dec 2021 18:18:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:150a:0:0:0:0:0 with HTTP; Wed, 22 Dec 2021 18:18:10
 -0800 (PST)
Reply-To: tsh1179@yahoo.com
From:   Shiina Terumi <shiinaterumi47@gmail.com>
Date:   Thu, 23 Dec 2021 09:18:10 +0700
Message-ID: <CABZgF6kJ_gxAkrYTDhcVxCaZ5EAewiNBb6ioxfmCQ7nAT0soqA@mail.gmail.com>
Subject: Good Day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R29vZCBEYXksDQoNCkkgaGF2ZSBhIHByb2ZpdGFibGUgYnVzaW5lc3MgdHJhbnNhY3Rpb24gdG8g
ZGlzY3VzcyB3aXRoIHlvdS4NCg0KR2V0IGJhY2sgdG8gbWUgZm9yIG1vcmUgZGV0YWlscw0KDQpS
ZWdhcmRzDQoNCk1ycyBTaGlpbmEgVGVydW1pDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQroia/j
gYTkuIDml6XjgIENCg0K56eB44Gv44GC44Gq44Gf44Go6Kmx44GX5ZCI44GG44Gf44KB44Gr5pyJ
55uK44Gq5ZWG5Y+W5byV44KS44GX44Gm44GE44G+44GZ44CCDQoNCuips+e0sOOBq+OBpOOBhOOB
puOBr+engeOBq+aIu+OBo+OBpuOBj+OBoOOBleOBhA0KDQrjgojjgo3jgZfjgY8NCg0K54Wn5ZCN
5qSO5ZCN44GV44KTDQo=
