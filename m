Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5037B9F9A
	for <lists+linux-usb@lfdr.de>; Sat, 21 Sep 2019 21:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388321AbfIUTaa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Sep 2019 15:30:30 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38450 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732308AbfIUTa3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Sep 2019 15:30:29 -0400
Received: by mail-pf1-f196.google.com with SMTP id h195so6649523pfe.5
        for <linux-usb@vger.kernel.org>; Sat, 21 Sep 2019 12:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=jxhHyribrbkUev194bwZR5aYl/hhord7yOQ96WoPjJU=;
        b=kaZH2ZlRzpHcvgN1HoPM3NMj296ghvUvfCh4BWCEH9iNFET0ztfGxX0LhmUkux4SZi
         tN5VItHivsLz2b/uaddn+7f4tpNbVgeUHlWMJNwrhcVlzYc4zZasxv6gb41Mj6jmbij5
         L8Iv0WM3V9uP39utNUqB0WVa6MI4p87UCub4KrwxsfcFt13haEMH9HDeaAr6FNs8FCru
         Yrzn9Pxfkk307l5iHvuQiBwvVAevCsVdKUHgSl01NZHhO/TEI9wK+neV4ct5XdddXIgk
         jbMy8nyFLLQM6hPmTq97dlxp9riqt3v+yezjABL4H8k/WH7LczzK+6nx9Be2sPHo+4Lr
         tF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=jxhHyribrbkUev194bwZR5aYl/hhord7yOQ96WoPjJU=;
        b=o45x6UGv6P83uv7WK54eG8r4L8bE5XpaZ4dIlqkFTO2zjVDFHHRiSlSYFa9vPmwMw1
         nODnNL4n8GhEYviIiO66orwO7TGc+WnahugSIQ2Z/JrpEx2Y2I2D49fNV7X3YbPp4Igk
         QTAZpCyloI/ciL/b5to1SM8GtGF0yMgoGgiQXf/EeXWSTPevg54NdW/UeGx+pjQB8whP
         fBLFlRa3vJQFkVdDmQwIXik9NUlx0m9XJqlW2pFPLpe80dOiRZ6LTLptZgSrmZEHTyk7
         f+Kj0HLMzCP6/vwh/8tDimrN5YPpB4VpDf003IGtK8Vm1+L5aXOuyAX4N73Djl+bT1YR
         dAZQ==
X-Gm-Message-State: APjAAAXirA2i+nONIG0Zk64uMXOC7oMkKlaHGfAgJRTm+/YZFTsY6lsT
        SL3f5u8OZvLLGLli+EWcoFcvBA==
X-Google-Smtp-Source: APXvYqyJ8IWk13ySKcH8ZWHeX0DmcfZFfbo2qfr05QUAu1RyZrXpvMmUFO1K5geUDmk0BkaxwdqZtQ==
X-Received: by 2002:a63:1c09:: with SMTP id c9mr21767992pgc.347.1569094228763;
        Sat, 21 Sep 2019 12:30:28 -0700 (PDT)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id ep10sm42006456pjb.2.2019.09.21.12.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2019 12:30:28 -0700 (PDT)
Date:   Sat, 21 Sep 2019 12:30:26 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        Oliver Neukum <oliver@neukum.org>,
        syzbot+ce366e2b8296e25d84f5@syzkaller.appspotmail.com
Subject: Re: [PATCH net,stable] cdc_ncm: fix divide-by-zero caused by
 invalid wMaxPacketSize
Message-ID: <20190921123026.7f26e537@cakuba.netronome.com>
In-Reply-To: <20190918120147.4520-1-bjorn@mork.no>
References: <20190918120147.4520-1-bjorn@mork.no>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 18 Sep 2019 14:01:46 +0200, Bj=C3=B8rn Mork wrote:
> Endpoints with zero wMaxPacketSize are not usable for transferring
> data. Ignore such endpoints when looking for valid in, out and
> status pipes, to make the driver more robust against invalid and
> meaningless descriptors.
>=20
> The wMaxPacketSize of the out pipe is used as divisor. So this change
> fixes a divide-by-zero bug.
>=20
> Reported-by: syzbot+ce366e2b8296e25d84f5@syzkaller.appspotmail.com
> Signed-off-by: Bj=C3=B8rn Mork <bjorn@mork.no>

Applied, queued, thank you!
