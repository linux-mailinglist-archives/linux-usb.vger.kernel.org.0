Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81C1C4EDE6D
	for <lists+linux-usb@lfdr.de>; Thu, 31 Mar 2022 18:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239554AbiCaQKk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Mar 2022 12:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239322AbiCaQKj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Mar 2022 12:10:39 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9835A6414
        for <linux-usb@vger.kernel.org>; Thu, 31 Mar 2022 09:08:50 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id a1so421379wrh.10
        for <linux-usb@vger.kernel.org>; Thu, 31 Mar 2022 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=o2Yn/h3KAaawz9BBLTR9h83EJKTs0GPzz+wLbE97qA8=;
        b=mgecW7VPRXyFFVWedQodlSHuF0bUIPwgbP6kn4nBUTQ9idFqLZvP6X1937NHYmR9wr
         pl52P+bLvmtton5Z5NSxQFndc1euRI5t4iPYe7CM7Gp2FOlOfpan7oXzCKvWzUq42w8r
         WcC7nE26jNEzO6HcyIgl1AL6OUYsYCkhmXJyTrV1YfD4tzQI+awbAK2LA+l7F4UOXN0Q
         pHrPStATV11jubSQ+/wtUqTIOiPAY/BnyS2OyYKNZrfaehyqu/oDXlijQ/UGBYUcXfU3
         DmBD0DrKJ3RilUYsOxzbHuANVHH4vPdK2Fg5jmqBYyGxRdixCL2PISzE/8+HIbFrHan7
         kHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=o2Yn/h3KAaawz9BBLTR9h83EJKTs0GPzz+wLbE97qA8=;
        b=3VJacqnlEB8JfQY7BBRDDUl60Rt5Ut3PUrTXPgAmWBBvL109fpJNqpBU5eLy5lWe5c
         9lI3snha2FWowGn+vf+5ML4pQxGUnbozQbj1grGPXY0ilEcV5iLnaojxqammaVVnKG0P
         xS5au7LYQfgo6UH7/RJOpIVloR/Y9i/DriY52EcZuc2dQDmg5OqeE7l6+vJ5UcnYJswd
         Nj3JvXCONG/foErxgVzPfaKYYzEsqNQOWcyMDfrCUOiB8alrfZuLQZ7DXiHmNVfMNeZz
         JYXP554iRbefcaDwoxlvDg1PUIUhEldC/qvoZCYRfVcgK9ZBcobsvT1NAqvCaBjLMDmN
         dS3w==
X-Gm-Message-State: AOAM531HoiCUmzsgRCICckMk2OabJ8HN0h4840R6v/OdLgFGuYG1vCx7
        YNl7drGDTgALNAFL0tDn3urusJISfnA=
X-Google-Smtp-Source: ABdhPJweFISNVyBuAhwYRALUSjixMPVQMZO8kSUipxHqwJN+X9EwQt95EZhC33AYLxLDBSvDNTYNGA==
X-Received: by 2002:adf:a497:0:b0:203:d9cd:4c94 with SMTP id g23-20020adfa497000000b00203d9cd4c94mr4781024wrb.368.1648742929386;
        Thu, 31 Mar 2022 09:08:49 -0700 (PDT)
Received: from DESKTOP-R5VBAL5 ([39.53.224.185])
        by smtp.gmail.com with ESMTPSA id b10-20020a05600018aa00b002042a98168csm23746766wri.15.2022.03.31.09.08.48
        for <linux-usb@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 31 Mar 2022 09:08:49 -0700 (PDT)
Message-ID: <6245d211.1c69fb81.3dc3a.eedc@mx.google.com>
Date:   Thu, 31 Mar 2022 09:08:49 -0700 (PDT)
X-Google-Original-Date: 31 Mar 2022 12:08:48 -0400
MIME-Version: 1.0
From:   royceldreamlandestimation@gmail.com
To:     linux-usb@vger.kernel.org
Subject: Estimating Services
Content-Type: text/plain; charset=us-ascii
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

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0ARoycel Wahl=0D=0ADreamland Estimation, LLC

