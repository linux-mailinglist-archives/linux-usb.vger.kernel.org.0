Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 952CB192A47
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2020 14:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbgCYNmW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Mar 2020 09:42:22 -0400
Received: from mail-pl1-f172.google.com ([209.85.214.172]:44456 "EHLO
        mail-pl1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgCYNmW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Mar 2020 09:42:22 -0400
Received: by mail-pl1-f172.google.com with SMTP id h11so803994plr.11;
        Wed, 25 Mar 2020 06:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:to:cc:subject:mime-version:content-disposition
         :user-agent;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=uKOgZlOJn70BBq9Mz+0uWw0S1aJZwuGEywdIMaae3va3d39rELLyzPApHt7x7URmbR
         w5ZUahOn9DopqD5Dlfeq16KTztyyuxq+fIO7kPNfP+sIrdg8cOHG9SnpjzWmJil2Nq3V
         b3z7QJT1nndzRb1AwSr5Dyk/CP6gdpceTt4DY+1qfK86hyZ+tf6EYrKVLPxWhTi86E6H
         JZJepS91GHGQXCgtda9TKZ3JysmrWspnLY8G0VB0UAmhIN0Ame1cgIHu78lXe0nZD4pF
         eAxoIH5A9q/H4JX91/p5wAyw2YCBx1Y9pWG3AJ/H3ljCPftyNEBjpPiHJIHV/iZU3Jfg
         gbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:mime-version
         :content-disposition:user-agent;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=mf3LsZc7s0ztC8a+1dmUztLkCM2Dh+2DKDrkZ/3atemAak+V1Po2lyou0fF+lou78y
         jSg0kbJyXTWrKZ94219Rzjd5FpThaXPHIHeRbkPnmmy+FVaxe1mJp9toR+FmsLz8//uQ
         yGSSD57hz1uY406j04nHJTZz7jULr8fO6GrsRpzGtm/GXV9WikQ1a26Er6M3FxmK4WrZ
         d2dN+DZGH/k8rhIe5c6hDYdUiNTVtpk3ey/pmjvO3u+VWqGZ8lOQVZbYsKFt8vh0DNsR
         geq7PmKzXiNZq5jY2RwsZbk7Bb6zGE3ttPAm3Ns//JdRdX+Ol2euH9RNbHmkV2O0M8eb
         WeIg==
X-Gm-Message-State: ANhLgQ1gFlRXCpaYB9jAjCxvUSbMLHdoh+7F1Eq8pTJhokW3VtYvx2ev
        MPg0mckt49fTZGPOwBhJ29Tq5D9m
X-Google-Smtp-Source: ADFU+vviT0X6Sxgrm6YS1rFEiqOhOkrSjOThpaT5hW2Bz91MGRA0d+IXaCMgteXXJ2xIhi2bF0E+iA==
X-Received: by 2002:a17:90a:fc8c:: with SMTP id ci12mr3773557pjb.152.1585143740743;
        Wed, 25 Mar 2020 06:42:20 -0700 (PDT)
Received: from SARKAR ([106.51.108.92])
        by smtp.gmail.com with ESMTPSA id a71sm18588165pfa.162.2020.03.25.06.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 06:42:20 -0700 (PDT)
Message-ID: <5e7b5fbc.1c69fb81.cace7.7aa1@mx.google.com>
X-Google-Original-Message-ID: <20200325134217.GB7983@rohitsarkar5398@gmail.com>
Date:   Wed, 25 Mar 2020 19:12:17 +0530
From:   Rohit Sarkar <rohitsarkar5398@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     linux-newbie@vger.kernel.org
Subject: Beginner query regarding usbhid
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

