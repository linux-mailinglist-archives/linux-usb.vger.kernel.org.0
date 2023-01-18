Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99D43672A0C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 22:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbjARVM1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Jan 2023 16:12:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbjARVML (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Jan 2023 16:12:11 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB44A65ED8
        for <linux-usb@vger.kernel.org>; Wed, 18 Jan 2023 13:10:59 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id g12so12197uae.6
        for <linux-usb@vger.kernel.org>; Wed, 18 Jan 2023 13:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TS776QSf+XZfy673cDJNFU1tHVWrzQdFJV93jLAyIM=;
        b=HmstFmURihK4+ylvnoptMna+I7kdByAYxYL9SZRp03eeNHWxSCbt+Dzs8guh6w4ZCr
         BR/BUG++M/5/+/nB7yLxokARzGRgb73TOUYOVyLd+Xj2/C8JR9LQTX7q1QkqIBxEMxix
         MLbF9r+A5EAhgk1/bymGKHYO1ISHfzfXWGlA62MX1y75LXD1GwIhZ16x8RDxo2p1XHvj
         WD9y7a515SD1I6pY22hsdzBgbpXV1GonSn8Ilxcr1nqh/ddeXgRw4x9Ovu64AMysCPHv
         U5/gAyFapRKvJBd6K0lZeoXCCAvR3o6HOqxY8zGZYxLnAig+pgbWJVuHt3wj/ApOrISv
         2aBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5TS776QSf+XZfy673cDJNFU1tHVWrzQdFJV93jLAyIM=;
        b=MjItzIePQMoOMkOxlFGI3cNyhUtLTRMpPPdjZO/rVf8dkWHWTb9xdU0J6AhQiBVRJT
         kis9IZvXwJZVUibQp3IeooNKlKW1OKqecSccY1iqzu3eNbrfoA0BqqrV5NR+9cGccuZL
         lh/IfLb4IFIfnHng/GoYD8NJLvViz9YgNEUKC5xgCe7udLNrItNg/WQTCfL5T6Ix0qjr
         PM25T3gWZsjQ3i6TVTFNwnk7Nm1SCNED8sbuK0rNrUj7LXqmcLbh5PpFaMEILSfRrp23
         lJjbCuycCVv/r9XuE54tP3TBD4X+zaH8OypgH+noSatQi/d5cg8uflR7yWYaI/39VaJa
         Eylw==
X-Gm-Message-State: AFqh2krOEHtb5Au4l5CjgYjUfB78VRAnjSl+Zi4gVOPOc1+l0rw/CnvX
        oWSSqWL34GU7XmIv4u2u/GYMieDksB8DNwNrpA==
X-Google-Smtp-Source: AMrXdXsgVEAig4M6cr6lsszD3k0ZOeUOPM/F6313bbvg4reKnY+uWSSHf3pAplM43DZyklWQ/uR64o/i3q60fSHi6G4=
X-Received: by 2002:ab0:26d3:0:b0:425:d41a:a2a2 with SMTP id
 b19-20020ab026d3000000b00425d41aa2a2mr1033982uap.10.1674076258901; Wed, 18
 Jan 2023 13:10:58 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:3d14:0:0:0:0:0 with HTTP; Wed, 18 Jan 2023 13:10:58
 -0800 (PST)
Reply-To: illuminatiinitiationcenter7@gmail.com
From:   Garry Lee <kalungipaul7@gmail.com>
Date:   Wed, 18 Jan 2023 13:10:58 -0800
Message-ID: <CAJqFtviHG3WcFpX4SPwfoBUi=HwvmNMatSQySjkg2Snn6Od81g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,
        UNDISC_FREEM,UPPERCASE_75_100 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
DO YOU WANT TO BE RICH AND FAMOUS? JOIN THE GREAT ILLUMINATI ORDER OF
RICHES, POWER/FAME  NOW AND ACHIEVE ALL YOUR DREAMS? IF YES EMAIL US :
MAIL: illuminatiinitiationcenter7@gmail.com

YOUR FULL NAME:
PHONE NUMBER :
COUNTRY :
GENDER:
