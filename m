Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 154C0658AC8
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 10:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233044AbiL2JKj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Dec 2022 04:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbiL2JKh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Dec 2022 04:10:37 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2710C12D0E
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 01:10:36 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id a64so14377054vsc.2
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 01:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8doeLmuvVKhDsGtF8cM6Xg3JYAQfa94SkmnfTJ+xDs=;
        b=i9hz9phm0UABbS7vqSLg13vMxh3s4wTcyscY21SiO+Og7/dPtq9f8T4so+vhbuPlyB
         g1h59Q0PjRcvMtEM+VeCt19gfyhtLbYa1MmLBhHV86Sbomr3+7xAm1PLFdExJknkf/He
         4zywNjLoQMgsNSYodMZjtecRQaZDbKi5pwJncqkZ3K00H5znjEdeRkWG3bHibdPXgYwB
         EDUpsMHYKDtLJ7g8435CR9CaKtyvL3uBAls18ETreSUDcGYCHp1ap0GU042pGtalwRnV
         +RiXSFpQu2UyVDncIujDGKIGtd6JqVGl9xZlpP2jXhMx+PK0EzGLP5xBjJLan6Ny2iD0
         zDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8doeLmuvVKhDsGtF8cM6Xg3JYAQfa94SkmnfTJ+xDs=;
        b=b3iyz/d1FBScYmWykftTR5R1+cXx5xt4DzLuLLKVWB5ArapbC5Ubt+gMG3XOKpYlD1
         8+cJvGN+LKovYXNZUWX3r5yH6WC91069mQJudCGgybnPw1MXyoOj93orBQBP4jY1DcZT
         +KPeFQprd4m+666n6QztoW5if/5BJCn9FcuA6SJ4VCPZuwt5Q9xBGXhxCAOmdHxYpZPq
         Fjv1igPO9qc26xcXBWRlDBkp+qvrKeWrrKul1iM52HQg452xYvU/Y+G3oLXqwrS4il5g
         6ayTuIEgjnQj/be1ZousCGFPJmlvx6kH+Jy6sxaliD6cctXGG4q/eabziUeRGeYQwndy
         +Eww==
X-Gm-Message-State: AFqh2kqYMIOlpyd9O5KW26Q2WtDOkQ9mp8yajOCgjiHvc5X9sHRpTLS3
        7HgL3U0UtLpL5maT5aFmPIy4iOzr8h0lTEEE90Y=
X-Google-Smtp-Source: AMrXdXuvog+v0O+sesezlIICZ59viOg6xyHkwwzExGFZW+ytoHlXDY115ems7pWLMAbKHyMVuFFfWR81ZOEcChs/qpg=
X-Received: by 2002:a05:6102:3c3:b0:3cb:7e7:75ce with SMTP id
 n3-20020a05610203c300b003cb07e775cemr784012vsq.81.1672305035230; Thu, 29 Dec
 2022 01:10:35 -0800 (PST)
MIME-Version: 1.0
Sender: barristerediwin@gmail.com
Received: by 2002:ab0:1346:0:0:0:0:0 with HTTP; Thu, 29 Dec 2022 01:10:34
 -0800 (PST)
From:   Barrister Edwin <barristeredwiin@gmail.com>
Date:   Thu, 29 Dec 2022 01:10:34 -0800
X-Google-Sender-Auth: jT6z3iBy6UPd2XqkqOCB_BoOvyo
Message-ID: <CA+pvoOkWip4OxUYbhOSZp6eOs4DAvno9UuQ7L9Acb8L-AwO8Lg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Hello Its very urgent you respond now
