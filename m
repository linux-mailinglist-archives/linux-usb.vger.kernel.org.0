Return-Path: <linux-usb+bounces-31927-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D78CF47A3
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 16:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4CE6308029A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 15:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C500833DEFA;
	Mon,  5 Jan 2026 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUBiqiVx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A307133CE85
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627675; cv=none; b=VaAlyHX6k3iyCRAnFypvUVoZf38Hq3EjBMwZ5szWm8tNaAtcp0JfVzKJjXst+HJaZuPMCaF3J5VqF8k78JI6DdNnzME4oe0/8MdX5aW9AXNzsiDUv1fZgQiWRebT1PQYStvHntqtyI9e1u6W1KsPvFo1dEbG+trkWpg9TOe5QMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627675; c=relaxed/simple;
	bh=7XOckaOqG/PMRqT76fU8qmeyL4hEz8+C+ksukJDZjK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGWGPUD2CrOy2ltnG3WXiXaS+Wmh/F9WokNBeF633DIgfXlPrV69eN5VFmQdo8en4KhyklF40fOnEAqIFEho+z+dK1sgOPlHPYWev51n6NbNbPS448ebBqPVma6EUFmp3zjBW9XDYjke97Z4RrA4mTxDvDsHDpR0ZuzrVHh1OVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUBiqiVx; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88a347c424aso1406d6.0
        for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 07:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767627672; x=1768232472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6BA1g1a3pdykyjLkvUREMTVpM7/WCPoUOv36P4M2nY=;
        b=RUBiqiVx/t7vGe/RuVzxTndk5myDZoEYkfhTue9om2uBkHmkh6wNYFMeygSKfoG57i
         g4rocB+BZkVWJDBF7aG5eK98iD/gtEoPszHnHmGmpL+7ZCWkvaMX9L5UKFDteiHD8EeS
         l7UHrIFRjibO8zrknZ7cgchU9IdVmyS2x9PsbihAp3V7VnZzIdR27daG66XcrUu+p/hc
         kmb0YHtx/4U2mjfU8CLYz1IKFKPfHw3hMBTu/8Fp/fRZeSmFdwkh/nhiCu6gxmqohHT+
         WFO/Gce068TXQuHwMpO/73nAGE7zUo8xE9+WRcSk/fWGkW7IHuvTxVEXWmk4HcteKsL4
         GMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767627672; x=1768232472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r6BA1g1a3pdykyjLkvUREMTVpM7/WCPoUOv36P4M2nY=;
        b=OUew9Phq0EVM4GWWQf3P6Mc5hIE+AdP2yM7KClo1R3b1xI7rmT8S5L0FAKPVdria1S
         WaSkBYefa+9ZRaDWqyAVkCuTAabBpcuU3hUhd+QXK/LLVcENF3iHnlwdpKsktVYvz/zh
         KZRpp1dghNzG+Mvxc+C0SgWcRKSEQl/puGn2GsBRwFlR5NLIm0mnf/GO2VNafaaOpbBV
         J1ImcWX8TVIwC3FUWe4B0mjigadG8fKov2yXB5QQ78w2dg3kEVm9wU0M1xu2vJwly2mw
         o/iSt70sAmRpr6eaj7SqK9drxSbBoHUZndOZQNIswbQVmr37Q7ooSB82G1Q07PZqANpL
         RB9w==
X-Forwarded-Encrypted: i=1; AJvYcCWFIbRIV2P8rwdo6OYtDxo7VDxAJan5EHjSUqS4Zks9xCf/q+f+IbEee/WHbO0oKCNGvDh1pRO70To=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDZhucgXDvnuyFriXEEnah/53aCjvFmqn5Fxr99HX9t1/8sQL6
	BpZqfNzkFeELdolC/M8TKriktFfJb8oFPelclxZwMtIWxgo6y8GS0owG
X-Gm-Gg: AY/fxX5pNH4OSviGy08MQFamfrIsEcMimA2gZ7kkzesgxvHGl4WLHwdgV0niTLnOirx
	v9+2onzA6NUyrvwMCgYi/TcfiiD61mN68/DJV9z6F9WMZWZ7Wo9r7fV/RJ7zHKSffYrp00yakE+
	BC9wW+DKAIFskkRWLbtsPlJj78x97rzgyP3E5Z0Qd+3VdgQWqL6ZkzsGxco7aZn8dWoX+Lkf8ZO
	hzNVH6G881tF/BnckQP0Ttdr4CNzsEB87MlFQaRliHxhr9XddqYECNpDUefjpjqQPaG1iWZPPTo
	FQl1jEYhJqUeEAPRz/nXhVUKR4nXuuqC6GTqy/i9q/0ry9pVhtik4xpwJBNZGYdUS/23Z4nUtq6
	HNNana+VU9igFHxz1fD/pXuzQ+hiV2zZ0n9LK826JpKyl/qlVwupLtjTraznwJRGcv/J2xOYmSM
	1pQGSdX9+8G1ALCEZFly+Ziku0tzGxaWV2y+OUluhQWmIVnb6a3L8YoVEMRxvrIG4aEBNOfV09g
	B+nzACKOHsGU3U=
X-Google-Smtp-Source: AGHT+IHeeyt4Xeum2e3H4UlfOCeEPZyOgjULTv/XI4YZg24EjWSSkO3V7ao10G0yIxqhA1gkrd4grw==
X-Received: by 2002:ad4:5250:0:b0:88a:4ab2:5f52 with SMTP id 6a1803df08f44-88d83d65360mr521106156d6.51.1767627672608;
        Mon, 05 Jan 2026 07:41:12 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89075557d23sm1207046d6.41.2026.01.05.07.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:41:12 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8F0F5F40068;
	Mon,  5 Jan 2026 10:41:11 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 05 Jan 2026 10:41:11 -0500
X-ME-Sender: <xms:l9tbaQl8adq_q8oemVdp9py9aCB5rEYMUXGPUHOfxSENDh0M6SOSiw>
    <xme:l9tbaVrCyG7LEDf5sozj9kkhyLQ0sPqK87jUAC_qJfbekq6ICe_xe5QMuMoTjEKUA
    tB0zjAhiqSBWufmhb_KP365bDbxKmKQ-BUeRDG7AXs90zPIyqpX-w>
X-ME-Received: <xmr:l9tbaTuvJMNXCwyVLLEQxwAkDuZHya194bV4WrOdHwOVBYRN60UCxK-j>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeljeeilecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeehkedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprhhush
    htqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepphgvthgvrhiisehinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepvghllhgvseifvggrthhhvghrvgguqdhsth
    gvvghlrdguvghvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdgslhhotghksehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:l9tbabmkDu5goAML_Vw6wQks5sr1-oqWVGEVyl7SpncPG41qLq8PqQ>
    <xmx:l9tbaZEvXpCwph3gfl5iq-kHa4fsrJ-e6g21CjltgBbR441YOY405w>
    <xmx:l9tbaa8pxEfCJ2_idKerH3733Rocx35rGJlDBn4X7HlKs2MkaFUX5A>
    <xmx:l9tbaW7nR-qjUaIEByc4-kPNbC8tpKXp-OM_EvS1h_evQ7bx_68mJA>
    <xmx:l9tbaS4UkZJm3L0Tu3phQb3ItLU_OD6WXZGJ8xIIxpleNVBlr6HjnmTP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jan 2026 10:41:10 -0500 (EST)
Date: Mon, 5 Jan 2026 23:41:08 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Gary Guo <gary@garyguo.net>, Peter Zijlstra <peterz@infradead.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>,
	Andreas Hindborg <a.hindborg@kernel.org>,	linux-block@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Benno Lossin <lossin@kernel.org>,	Danilo Krummrich <dakr@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,	Paul Moore <paul@paul-moore.com>,
 Serge Hallyn <sergeh@kernel.org>,	linux-security-module@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ard Biesheuvel <ardb@kernel.org>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	maple-tree@lists.infradead.org, linux-mm@kvack.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vitaly Wool <vitaly.wool@konsulko.se>,	Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,	linux-pwm@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>,	rcu@vger.kernel.org,
 Will Deacon <will@kernel.org>,	Fiona Behrens <me@kloenk.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,	Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,	Lyude Paul <lyude@redhat.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>, linux-usb@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Tamir Duberstein <tamird@gmail.com>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 00/27] Allow inlining C helpers into Rust when using
 LTO
Message-ID: <aVvblLp8sjFB7JvB@tardis-2.local>
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>

On Mon, Jan 05, 2026 at 12:42:13PM +0000, Alice Ryhl wrote:
> This patch series adds __rust_helper to every single rust helper. The
> patches do not depend on each other, so maintainers please go ahead and
> pick up any patches relevant to your subsystem! Or provide your Acked-by
> so that Miguel can pick them up.
> 

I queued the following into rust-sync:

       rust: barrier: add __rust_helper to helpers
       rust: blk: add __rust_helper to helpers
       rust: completion: add __rust_helper to helpers
       rust: cpu: add __rust_helper to helpers
       rust: processor: add __rust_helper to helpers
       rust: rcu: add __rust_helper to helpers
       rust: refcount: add __rust_helper to helpers
       rust: sync: add __rust_helper to helpers
       rust: task: add __rust_helper to helpers
       rust: time: add __rust_helper to helpers
       rust: wait: add __rust_helper to helpers

Thanks!

Regards,
Boqun

> These changes were generated by adding __rust_helper and running
> ClangFormat. Unrelated formatting changes were removed manually.
> 
[...]

