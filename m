Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 185C5138627
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2020 13:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732767AbgALMGl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Jan 2020 07:06:41 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:33458 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732687AbgALMGk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Jan 2020 07:06:40 -0500
Received: by mail-ot1-f54.google.com with SMTP id b18so6451658otp.0
        for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2020 04:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=0RzGBu12ZQ8abE6gWjl8/M+37TpP43Q/7emVdEaMzeo=;
        b=tE4+aIA8kSkrqCd17v/uoTbmS/DD3QJmYc4lTUdnf/5M2YpwBWKpszsETmu0XcHY6u
         pd1i2XmoDL+nLRSQibNNHhgGh/FxbPZ2RwFf6H1GqfNPUpp97MqV0OZkrYfXJWgtvhuM
         luNS/76KVT9aWQA58HWI2PbPna/ejtGNdNM3lk97glVhHAdgZ7ZQAO6tNMJnEt7YNLep
         XLtHxzS35BghMaAT5yQEkNKbpNG+vWChKjJH0W9j7zJ0WxhmB+NmZ1XIGEVhMfT576vR
         7jKhy6COhaRbV87AMbelbgFsdJQPRMlY1pPLGavhZRU42hh+LeoVHMkkyxLLryFHG1xv
         IQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=0RzGBu12ZQ8abE6gWjl8/M+37TpP43Q/7emVdEaMzeo=;
        b=HyjpmJXhqjpy0DUA/NGhPzEHVDwvPZR9rMFwQi6kha7eyn6bXNDYf4ptUcpsix3mz6
         SKVJwrLdKVSKfo8m4nnjDRBhALvf86pRYnFHYdVPFZutg++YJTbivUZUrJjhCT0gHWCg
         c1x5O8XNq1dzejNhPO8SqhanodiKNKqjTvX6z0OBRiK3uCqp0TIuAXtqMkvjX2NMk8I1
         yNsyZaq6uJEU2fC734N/uKaIZw4RKnPvPPG1Iy1V0cROCuWUQTmofeR7ddHC8/51HuKG
         wvuKzYTlRDhTPoGqXd7XdrB9p4lGau50r580RfSmi+2mfGeMSzrQ+HPuWgFaL5Q0C7PC
         /BXg==
X-Gm-Message-State: APjAAAX6F0vz+LqP2yQK3Pt1jE7dq9dvmR2XnVlndut2G2iVTb1NRklY
        nV9rzcUVFkppu5NO/ODWOaWP1DRQcfVgUhR7XbQwEd30YPE=
X-Google-Smtp-Source: APXvYqzeBvMGXf3IW1+Yaus6pZvtv2ebZY+eyc8GJ9n5dJXHQmGQbURgs6JrR95PjVJAoNc7RLgz0cg/vhDrFxoYDeI=
X-Received: by 2002:a9d:6b17:: with SMTP id g23mr9179290otp.265.1578830800020;
 Sun, 12 Jan 2020 04:06:40 -0800 (PST)
MIME-Version: 1.0
From:   Richard Dodd <richard.o.dodd@gmail.com>
Date:   Sun, 12 Jan 2020 12:06:29 +0000
Message-ID: <CAAWug1d8wv3Thu0b==j6fLajU965unYKs552j+s9t13MOytmng@mail.gmail.com>
Subject: Usb midi device does not work on wake
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello

I've got a Novation midi-over-usb device (LaunchControl XL) that works
correctly on boot, but remains in power-off mode when waking from
sleep.

I suspect that there is some sort of initialisation that needs to be
applied. Could anyone suggest possible causes, or point me in the
direction of the relevant source code. I found `sound/usb/quirks.c`,
which seems to be the place to handle this kind of thing, but there is
no mention of my device anywhere in the source tree at present
(1235:0061).

Thanks in advance for your help
Richard
