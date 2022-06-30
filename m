Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 045A65618D3
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 13:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234003AbiF3LO3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 07:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbiF3LO2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 07:14:28 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8724579E
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 04:14:27 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id F22495C02B0;
        Thu, 30 Jun 2022 07:14:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 30 Jun 2022 07:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656587664; x=1656674064; bh=EsrNbFpccM
        2AgGjQOXVmHc2W6hZp5ohX4dDO4itbDl8=; b=JiuEe8qoiJOuDv0GWI3BwUS2Vz
        hzrwQ05C5Eh0lBWD+K1xrnM0zm8PgjXqIXKOCdN+RdtUN/yFmqv9TcXp2NAdm6Uf
        Ir6i/9p2tN26Xi0VCyLyLrdOsMBVopTX6maNfcYGKXpvqSBnFekf5ZqTVxNC/L08
        /nrnFR51KhFzKlq8KX6t+mnEDacSN9j3WAd+eHmBCzR1UbVtRHum9bK9YOcnGr3+
        FWeocd8fQVN0LgVhGc3W7bG8g9dDe4LevlhgaiMI2qDnYnBq9GBiP1Vwvv1kjx+r
        cCqoVYxMNDMbu57YV2C88zTDT76HulggwSDsY5rUgUgDlHM/BjcvXWMx9fjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656587664; x=1656674064; bh=EsrNbFpccM2AgGjQOXVmHc2W6hZp
        5ohX4dDO4itbDl8=; b=Swhrubko6m2UwJRcqomv21nnUYyhdqAFb8ruHdAKO8b+
        Qi/eQtk9Wwo1dv7WDzXVbVfSdYSS3wpesoiqJB+iI3bKIHFjkf3C8PvLE/7N18VR
        7sGVl/fPXkumnIOMOkmCP6ic5xbyiLui2NnvopzrBhyhkEA4AbtNpxuKWMACYKQ7
        Y3c0Xw9NFU7Pzjz/A8iPVX002J8OB5A+vPe40cHebGzX1EgG86e43c1nU5VREloc
        JGn6L0Zhx3FQXaAwTE12A6Wd7pxQkwVEDO8jqUBPT9H3DLqqY9EYV4TdIRL3J/6N
        cEnp6OjOMKUXMOHPQN5s9juBAtIECUnr3Afqura08w==
X-ME-Sender: <xms:j4W9YpWZAbJ4tapR1923x_kT10n8HR9hu6KPCTbzEJWD1vefOrBIsA>
    <xme:j4W9Yple_E2bq9Q7oT-VdO_b26sin-M4cwfVF1-fR7WK8lRkClwREz7YnIz8kwK83
    iS70a-IkHGahA>
X-ME-Received: <xmr:j4W9YlYV3su_61OfKyJEWnqwuDqbNh8QJE8ImIu-kXDL_1kdqwzlRyiRC2CvY4Vnq5nzdYcvpEePpAl7xy1wF0x-ZlEy9aMY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:kIW9YsXF5dh6vlLegS7yEMqYrnyWVDdltkPzWgC8ZzMedaF4HYqwjg>
    <xmx:kIW9Yjn3Yy3U8RI5zaJHc7I695JeNZDz1Sc8LX05-1QagOXEdcUGuQ>
    <xmx:kIW9YpcVIPspRR6ZCVqprGEPTW2vFs4yQyWoCKmQ7V-lf_PRwuM0bA>
    <xmx:kIW9YsfJikRiTsCEPzX4c94PUDm-gfeTP6pscGuajcpVLOO0x4lMeA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 07:14:23 -0400 (EDT)
Date:   Thu, 30 Jun 2022 13:14:20 +0200
From:   Greg KH <greg@kroah.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: Thunderbolt/USB4 maintenance on vacation during July
Message-ID: <Yr2FjIGgjKUjCpsA@kroah.com>
References: <Yr185R656uozcS25@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yr185R656uozcS25@lahna>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 30, 2022 at 01:37:25PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> I will be on vacation the whole July and most of that time completely
> offline. The v5.20 material is already sitting in Greg's tree. Once I
> return I will go through any patches sent during my vacation and pick
> them up accordingly.

Have a nice break!
