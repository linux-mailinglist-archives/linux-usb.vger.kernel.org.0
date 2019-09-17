Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B606B4CA7
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 13:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfIQLQA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 07:16:00 -0400
Received: from mail-io1-f47.google.com ([209.85.166.47]:42031 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfIQLQA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 07:16:00 -0400
Received: by mail-io1-f47.google.com with SMTP id n197so6561849iod.9
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2019 04:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=TmJo9YzUnG7TKkp/5xFERnrADHa4Nz8PRpi3ZSpeNbNfG2Ln26PdJJBRpIJBzZl1W3
         LobR7D7eWmVlXouLd4M4ha1UTj3DjkqJx7jzHHpoR+Ez4Ui2QOCrdbP/yzmDB4HOoCzq
         LlWqlQECyuk8rmApKxIl55Edsjx5Y8CVd2AJUXImR3bwfjNb6bf/FE5y7H/m7eppKAKR
         oDGAgc/kijry2ArcXN3KdAqk9+fBjFghAxmalDraxP3cp9mDzaN1+TORb7mr0BsrlwIb
         fD7s9pIgBHD0vSK0zGFLZlsQ9OihgmDbm+eqTK1XzMMqZLlaO1pq08cQjttbbHSbGafU
         x0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=AWaqMUDz7ThqLTnJ/2OMMBRrHLjOleMI40+HWNEdNBa+0E+Fom3ie0xYCbQqZEwdxk
         0WdTVZFVrEbIVnOlhnHoed3CiMOWpo5oKytTUS14DM0UE5SfVqwfb5++BTQQbvA7r5Fj
         H6keYAdfYXThJtb3OA0yDS3U/LeFCR6n81opQ8hdzhRwROnhXPvTuxv4Dj1drn1Rwd/u
         EyRadqW3NO7HUUvvn6im8Xzf8dkJrDp+iZkX90GgKw7ac5HFo+kqdScPS+u+Z/Kl4I3/
         WxfdACQavIWRsYULRCTU8BKLVG8o7/+pRjlr4rXyWCnahjRhHBantbzRDDrUipjyuWVo
         isFA==
X-Gm-Message-State: APjAAAUvaHqgxew+tagngnFtxCi/+QpVk8uVEsxNv8oWOACafVMLsiO3
        FqfO4RMOB8fsoJES26NKSvhcVS1KTwJDijkIGHlC7w==
X-Google-Smtp-Source: APXvYqwSCWiOi/xdGXDsWhyeJPbsMgkzHfzYw8dXyWL2lQGHbzjjxguPbPuS0rvB4UZUc1/BlVmtELbWG8wP328R3Uk=
X-Received: by 2002:a02:6601:: with SMTP id k1mr3698627jac.47.1568718959578;
 Tue, 17 Sep 2019 04:15:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Tue, 17 Sep 2019 04:15:59
 -0700 (PDT)
From:   JH <jupiter.hce@gmail.com>
Date:   Tue, 17 Sep 2019 21:15:59 +1000
Message-ID: <CAA=hcWSp+CyP4of5JhdTkCf+jSnsT7-YfHz+4dKAyYv6SdLO5w@mail.gmail.com>
Subject: 
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


