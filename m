Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00A136B6216
	for <lists+linux-usb@lfdr.de>; Sun, 12 Mar 2023 00:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjCKXgA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Mar 2023 18:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjCKXf7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Mar 2023 18:35:59 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19EE497F5
        for <linux-usb@vger.kernel.org>; Sat, 11 Mar 2023 15:35:58 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id kb15so8667141pjb.1
        for <linux-usb@vger.kernel.org>; Sat, 11 Mar 2023 15:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678577758;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87dcZszEk8ij6lSi/CqcaBS8yPG/kXnAghqk+AMY8Rc=;
        b=YCgj5Ih5BNCuOsGWg0Yx+XvcRSoy5xJ91kd5lCvAYVl1ikRXF6m0ErsMGqvgE0qcCU
         xq1xrOITxvUAOYlMsvlUn60JGe/SZCY2ggf/s9RBCtzqA+mn3uyCROMdtYH4ONFD3SAV
         TRBrJS1eUXBwvtLJlo8V4lQCappeMUQBqGkepdowj98UOd5xI/jHuCWdpI7NqUOtT/zE
         BYXJfICvNp21RVNQkQ7bGRdFwMpx8AqN8WVkuc+jqSLXpisIlwxbxJbqZak8Nx//fFo+
         2zcgmdGWXbGPvZBclfghLfIjjRAePqnq0MzU8fnFpVpSyjUIxN+FIBp0yKmPfbSYAGDE
         DvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678577758;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87dcZszEk8ij6lSi/CqcaBS8yPG/kXnAghqk+AMY8Rc=;
        b=V955hpcqEZLgspd3zvypKjS/oC/xkNBJO67GBw+Bxrr+GugwIRMrK0LAwMpQjJlzRB
         QqJh/KDPeFl6ql0Qt2xoiSITeYfualR7BmUWuqBoHP/WX/SAtF+uxJ5krliOBJC5ISNo
         kMsvOO4oHpEL8iQqmn0zh7zmQft7Llzfcy2i0S9quKVoxsuBp6q9KnwWWs/nBsm1SN89
         FUmvfKWY7aLp+VfiNdXv15FLsr/KLfgayNsacMEgwTMIuV6cTCYbSQ52p4qAWZDWq4XH
         5OWYaQv3eWqEUQOJMPuRbABvYxa4EHnfzO+vUC06hlHiJmSZGMIfSgQIZ6/oH9iPn7KD
         gekg==
X-Gm-Message-State: AO0yUKUOfOaPGolXxidtKO/HcLBH+2JOWwMdWIup7YwuIHjSuukGQSkT
        vJ55/Rleh5MgRdjsMQdnNGVQkkioXMAlUYGgtEo=
X-Google-Smtp-Source: AK7set/aus3jR1YwlpwB5mZ/kQquvg0ipWXR4CuLjDriAzTfsFTAtv1yTGl2WMCy5k/V15Bz2SxjeW1lP+ToaNJkMMs=
X-Received: by 2002:a17:90a:5d89:b0:230:8d09:962b with SMTP id
 t9-20020a17090a5d8900b002308d09962bmr10881025pji.7.1678577758381; Sat, 11 Mar
 2023 15:35:58 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:6749:b0:442:fc10:ca13 with HTTP; Sat, 11 Mar 2023
 15:35:57 -0800 (PST)
Reply-To: enocvendor6777@gmail.com
From:   " Emirates National Oil Company (ENOC)" <jakubjakub871@gmail.com>
Date:   Sat, 11 Mar 2023 15:35:57 -0800
Message-ID: <CAMLysXos1cb4=5t54VDg26mcf0mtCfBeCW8AUhGEXTkdfTJivw@mail.gmail.com>
Subject: Emirates National Oil Company (ENOC)
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:102e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5012]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [jakubjakub871[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jakubjakub871[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [enocvendor6777[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings of the day,
We are inviting your esteemed company for vendor registration and
intending partners for Emirates National Oil Company (ENOC)
2023/2024 projects.
These projects are open for all companies around the world, if you
have intention to participate in the process,
please confirm your interest by contacting us through our official
email address  project-ae@enocvendor-ea.com
We appreciate your interest in this invitation, and look forward to
your early response.
MR. Nasir Khalid
Senior Project Manager
Emirates National Oil Company (ENOC)
