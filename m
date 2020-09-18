Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB4C26F82F
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 10:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgIRIaQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 04:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgIRIaQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Sep 2020 04:30:16 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111E5C06174A
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2020 01:30:16 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x14so4696469wrl.12
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2020 01:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:from:to:cc:subject:references:date:in-reply-to
         :user-agent:mime-version;
        bh=q/+K2B9QmnMKilu9ZMqvKB2311H2cHEoDw9nAY8V4SM=;
        b=MRYsieR7vOKP/Me0/wfTZdvztrgBvUYcbtpp9p1KC/i14WUjoe8uhuajAaTVg7Dl9i
         W7onws58MPteMovE4HABfXM7wKCrzXiZJsWu6r/MjtQMX/vGGA4SiocnlmJHc/UTzvps
         6WuUAYTC2/QWM7dgzIrwFi5P4yuE53+A5Xj/k8QT7QMGKuPctMWzauEPzIUeLZeswQm3
         Tx3uGJttSZPWf/6H1Hr2NQCPd7Ngy2MY/zf6XGmblx5/gTpy0ajxeYH+EpBgsyS3xNBT
         6Nu3jSTnA23JaXLkUYUb/3ktSj17ueLwuBbYNRaCMp/xVSt8dRN+MFQu4ZK0TDzrq1JP
         RkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:to:cc:subject:references:date
         :in-reply-to:user-agent:mime-version;
        bh=q/+K2B9QmnMKilu9ZMqvKB2311H2cHEoDw9nAY8V4SM=;
        b=raT2EoY8BtkdHO4Lxu5aEW5e1v9J7Jg5wV0Q9nJtMdWPg24O9xZx+wo/GvWpkaoiQO
         okU76QvOwkZ8RWXuZOVZWYjcNMuYIL0A3hf7DK6E1dqJN+0cBO4NcLAbKK+R35yu/R+L
         eLIRqGd9gyC7/Tz+XEu8nxgmqNLL2YdPBRDEJctlA7D98cHbgTyy7TXO+PL9CQfJNdFJ
         g8boQKr2JA4xNIFD/rFFMb7AvgKW98GToISC5ZB2nOs74D1vL90bvwPZ3YBnqkhAFnkd
         eENRe2+yJz0EpDw8hw45FdPfyCVEiCZgiAlvPFRgAqPrebb54Y4rhbxKbzxtC0NlHeSU
         78rQ==
X-Gm-Message-State: AOAM530oum3xQzlgLyqCfgdmA2o9z6sCGutKsDJQzm76TDd84dTQULXw
        Eqlc0PXui688fNTOxycFXaiOj85KUM4JJw==
X-Google-Smtp-Source: ABdhPJxPdx7AOY0Daj+14XUFmX6hjXSRSDDkdP3zBnJMNDWALktw+q1zTvyTJ6ISgh6SQNeO815bwQ==
X-Received: by 2002:adf:91e1:: with SMTP id 88mr35931137wri.305.1600417814590;
        Fri, 18 Sep 2020 01:30:14 -0700 (PDT)
Received: from daniel-ThinkPad-X230 (lns-bzn-35-82-250-215-35.adsl.proxad.net. [82.250.215.35])
        by smtp.gmail.com with ESMTPSA id i11sm3966769wre.32.2020.09.18.01.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 01:30:13 -0700 (PDT)
Message-ID: <5f647015.1c69fb81.41200.93cc@mx.google.com>
X-Google-Original-Message-ID: <87imcbqygc.fsf@gmail.com>>
From:   <f1rmb.daniel@gmail.com> (<Daniel Caujolle-Bert>)
To:     Johan Hovold <johan@kernel.org>
Cc:     "\<Daniel Caujolle-Bert\>" <f1rmb.daniel@gmail.com>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb-serial-simple: Add Whistler radio scanners TRX serie support.
References: <5f4ca4f8.1c69fb81.a4487.0f5f@mx.google.com>
        <20200918074519.GN24441@localhost>
Date:   Fri, 18 Sep 2020 10:30:11 +0200
In-Reply-To: <20200918074519.GN24441@localhost> (Johan Hovold's message of
        "Fri, 18 Sep 2020 09:45:19 +0200")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,


   I will compile right now and test today.


Cheers.
---
Daniel
